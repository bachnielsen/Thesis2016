//
//  ConsentTask.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 05/11/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //TODO: Add VisualConsentStep
    var consentDocument = ConsentDocument
	let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
	steps += [visualConsentStep]
    
    //TODO: Add ConsentReviewStep
    let signature = (consentDocument.signatures!.first)! as ORKConsentSignature
 
	let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
 
	reviewConsentStep.text = "Review Consent!"
	reviewConsentStep.reasonForConsent = "Consent to join study"
 
	steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
