//
//  SurveyTask.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 05/11/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    //test
    //TODO: add instructions step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "The Questions Three"
    instructionStep.text = "Who would cross the Bridge of Death must answer me these questions three, ere the other side they see."
    steps += [instructionStep]
    
    //TODO: add name question
    
    //TODO: add 'what is your quest' question
    
    //TODO: add color question step
    let colorQuestionStepTitle = "How are you feeling?"
    let colorTuples = [
        (UIImage(named: "emoticon-cool")!, "Great!"),
        (UIImage(named: "emoticon")!, "Fine"),
        (UIImage(named: "emoticon-neutral")!, "Okay"),
        (UIImage(named: "emoticon-sad")!, "Not fine"),
        (UIImage(named: "emoticon-dead")!, "Exhausted"),
    ]
    let imageChoices : [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let colorAnswerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionStepTitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    //TODO: add summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
