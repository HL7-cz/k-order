# Examples

This page collects document Bundle examples for the order profiles.

## K-order examples

1. [Cardiology consultation for exertional dyspnea](Bundle-BundleKOrderExample.html) - An unaddressed request from a general practitioner for a cardiology consultation and echocardiography, with a pulmonologist as an additional recipient of the result.
2. [Urgent dermatology consultation for a suspected pigmented lesion](Bundle-BundleDermatologyUrgentExample.html) - An addressed urgent request to a pigmented lesion clinic, including clinical photo documentation.
3. [Nephrology consultation and transfer of care](Bundle-BundleNephrologyHandoverExample.html) - Two ServiceRequests: a nephrology consultation order (`intent = order`) and a recommendation for transfer of care (`intent = proposal`, SNOMED CT `183444007`), including relevant laboratory results.
4. [Recommendation for hospital admission](Bundle-BundleHospitalAdmissionRecommendationExample.html) - A consultation order (`intent = order`) accompanied by a separate recommendation for hospital admission (`intent = proposal`), with its own identifier, reason and supporting results.

## FT-order examples

1. [Rehabilitation after total hip arthroplasty](Bundle-BundleFTHipRehabilitation.html) - An unaddressed referral for physiotherapy after hip replacement, including the date of surgery, permitted load, implant information, and reduced mobility.
2. [Respiratory physiotherapy for a patient with COPD](Bundle-BundleFTCopdHomeCare.html) - A completed home-care referral for an immobile patient receiving long-term oxygen therapy, with the requested procedures, ten sessions, and a frequency of twice weekly.
3. [Paediatric physiotherapy for poor posture](Bundle-BundleFTPediatricPosture.html) - A general order for a child with poor posture and early scoliosis. The ServiceRequest uses the general SNOMED CT concept “Physical therapy procedure”, while the physiotherapist determines the individual procedures and scope of care.
