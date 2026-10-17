Profile: FTOrderBundleCz
Parent: BundleOrderCz
Id: FTOrderBundleCz
Title: "Bundle: FT-žádanka (CZ)"
Description: "Dokumentový Bundle FT-žádanky s FT-order Composition a požadavky dle FTServiceRequestCz."

* insert SetFmmandStatusRule( 2, trial-use )
* entry[composition].resource only FTOrderCompositionCz
* entry[serviceRequest].resource only FTServiceRequestCz
