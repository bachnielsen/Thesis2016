//
//  PhysTask.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 01/12/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

public var PhysTask: ORKOrderedTask {
    
    let step = ORKQuestionStep(identifier: "yes-no-step")
    let completionStep = ORKOrderedTask.makeCompletionStep()
    
    step.title = NSLocalizedString("Do you feel good?", comment: "")
    step.answerFormat = ORKBooleanAnswerFormat()
    
    
    let task = ORKOrderedTask(identifier: "yes-no-task", steps:[step, completionStep])
    
    return ORKOrderedTask(identifier: "PhysTask", steps:[step, completionStep])
}
