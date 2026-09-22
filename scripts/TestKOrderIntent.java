// Run after sushi build .:
// java -cp input-cache/publisher.jar scripts/TestKOrderIntent.java
import java.nio.file.*;
import org.hl7.fhir.r4.context.SimpleWorkerContext;
import org.hl7.fhir.r4.fhirpath.FHIRPathEngine;
import org.hl7.fhir.r4.fhirpath.IHostApplicationServices;
import java.lang.reflect.Proxy;
import org.hl7.fhir.r4.formats.JsonParser;
import org.hl7.fhir.r4.model.*;
import org.hl7.fhir.utilities.npm.NpmPackage;

class TestKOrderIntent {
  static final Path RESOURCES = Path.of("fsh-generated/resources");
  static Resource read(String file) throws Exception {
    return new JsonParser().parse(Files.readAllBytes(RESOURCES.resolve(file)));
  }
  static void check(FHIRPathEngine engine, Bundle bundle, String expression,
                    boolean expected, String label) {
    // The validator supplies resolve(); this focused test resolves references in its document Bundle.
    engine.setHostServices((IHostApplicationServices) Proxy.newProxyInstance(
        IHostApplicationServices.class.getClassLoader(), new Class<?>[]{IHostApplicationServices.class},
        (proxy, method, params) -> {
          if (method.getName().equals("resolveReference")) {
            String ref = (String) params[2];
            return bundle.getEntry().stream()
                .filter(e -> ref.equals(e.getFullUrl()) || ref.equals(e.getResource().fhirType() + "/" + e.getResource().getIdElement().getIdPart()))
                .map(e -> e.getResource()).findFirst().orElse(null);
          }
          throw new UnsupportedOperationException(method.getName());
        }));
    Composition composition = (Composition) bundle.getEntryFirstRep().getResource();
    Composition.SectionComponent section = composition.getSection().stream()
        .filter(s -> s.getCode().hasCoding("http://loinc.org", "57133-1"))
        .findFirst().orElseThrow();
    boolean actual = engine.evaluateToBoolean(bundle, composition, section, expression);
    if (actual != expected) throw new AssertionError(label + ": " + actual);
    System.out.println("PASS " + label);
  }
  public static void main(String[] args) throws Exception {
    StructureDefinition profile = (StructureDefinition) read("StructureDefinition-KOrderCompositionCz.json");
    String expression = profile.getDifferential().getElement().stream()
        .filter(e -> e.getId().equals("Composition.section:orderInformation"))
        .flatMap(e -> e.getConstraint().stream())
        .filter(c -> c.getKey().equals("k-order-requires-order"))
        .findFirst().orElseThrow().getExpression();
    Path core = Path.of(System.getProperty("user.home"), ".fhir", "packages", "hl7.fhir.r4.core#4.0.1");
    FHIRPathEngine engine = new FHIRPathEngine(SimpleWorkerContext.fromPackage(NpmPackage.fromFolder(core.toString())));
    Bundle original = (Bundle) read("Bundle-BundleNephrologyHandoverExample.json");
    check(engine, original, expression, true, "order plus proposal");
    Bundle proposals = original.copy();
    proposals.getEntry().stream().map(e -> e.getResource())
        .filter(r -> r instanceof ServiceRequest)
        .forEach(r -> ((ServiceRequest) r).setIntent(ServiceRequest.ServiceRequestIntent.PROPOSAL));
    check(engine, proposals, expression, false, "proposal only rejected");
    Bundle unlinked = original.copy();
    ((Composition) unlinked.getEntryFirstRep().getResource()).getSection().stream()
        .filter(s -> s.getCode().hasCoding("http://loinc.org", "57133-1"))
        .forEach(s -> s.getEntry().removeIf(r -> r.getReference().endsWith("NephrologyServiceRequest-Consultation")));
    check(engine, unlinked, expression, false, "unreferenced order does not satisfy rule");
    Bundle orderOnly = original.copy();
    ((Composition) orderOnly.getEntryFirstRep().getResource()).getSection().stream()
        .filter(s -> s.getCode().hasCoding("http://loinc.org", "57133-1"))
        .forEach(s -> s.getEntry().removeIf(r -> r.getReference().endsWith("NephrologyServiceRequest-Handover")));
    check(engine, orderOnly, expression, true, "order without proposal");
    for (String name : new String[]{"BundleKOrderExample", "BundleDermatologyUrgentExample", "BundleHospitalAdmissionRecommendationExample"})
      check(engine, (Bundle) read("Bundle-" + name + ".json"), expression, true, name);
    StructureDefinition ft = (StructureDefinition) read("StructureDefinition-FTOrderCompositionCz.json");
    if (ft.getDifferential().getElement().stream().flatMap(e -> e.getConstraint().stream())
        .anyMatch(c -> c.getKey().equals("k-order-requires-order")))
      throw new AssertionError("K invariant must not apply to FT");
    System.out.println("PASS FT profile unaffected");
  }
}
