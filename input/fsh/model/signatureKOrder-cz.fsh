Logical: LogCzDigitalSignatureKOrderCz
Id: LogDigitalSignatureKCz
Title: "A.1.9 - Elektronické podpisy"
Description: """Elektronické podpisy - Elektronické podpisy nebo pečetě dle zákona 327/2011 §54a"""

* insert SetFmmandStatusRule ( 1, draft )

* elektronickyPodpis 0..* Signature "A.1.9.1 - Elektronický podpis" """Elektronický podpis nebo pečeť dokumentu."""
* casoveRazitko 0..1 instant "A.1.9.2 - Elektronické časové razítko" """Elektronické časové razítko """