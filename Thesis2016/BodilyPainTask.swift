//
//  BodilyPainTask.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 08/12/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

//case scaleQuestionTask
//case .scaleQuestion:
//return scaleQuestionTask

private var questionTextBP1: String {
    return NSLocalizedString("How much BODILY pain have you had during the PAST 4 WEEKS?", comment: "")
}

private var questionTextBP2: String {
    return NSLocalizedString("During the past 4 weeks, how much did pain interfere with your normal work (including both work outside the home and housework)?", comment: "")
}

public var BodilyPainTask: ORKTask {
    let completionStep = ORKOrderedTask.makeCompletionStep()
    // The first step is a 6 answer scale conforming with the SF-36 bodily pain question 1
    let textChoices : [ORKTextChoice] = [ORKTextChoice(text: "None", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Very mild", value: 2 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Mild", value: 3 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Moderate Average", value: 4 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Severe", value: 5 as NSCoding & NSCopying & NSObjectProtocol),ORKTextChoice(text: "Very severe", value: 6 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let step1AnswerFormat = ORKAnswerFormat.textScale(with: textChoices, defaultIndex: NSIntegerMax, vertical: false)
    
    //let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    
    let questionStep1 = ORKQuestionStep(identifier: "textScaleQuestionStep1", title: "", answer: step1AnswerFormat)
    
    questionStep1.text = questionTextBP1

    // The second step is a 5 answer scale conforming with the SF-36 bodily pain question 2
    let textChoices2 : [ORKTextChoice] = [ORKTextChoice(text: "Not at all", value: 1 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "A little bit", value: 2 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Moderately", value: 3 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Quite a bit", value: 4 as NSCoding & NSCopying & NSObjectProtocol), ORKTextChoice(text: "Extremely", value: 5 as NSCoding & NSCopying & NSObjectProtocol)]
    
    let step2AnswerFormat = ORKAnswerFormat.textScale(with: textChoices2, defaultIndex: NSIntegerMax, vertical: false)
    
    let questionStep2 = ORKQuestionStep(identifier: "textScaleQuestionStep2", title: "", answer: step2AnswerFormat)
    
    questionStep2.text = questionTextBP2
    
    return ORKOrderedTask(identifier: "BodilyPainTask", steps: [
        questionStep1,
        questionStep2,
        completionStep
        ])
}
