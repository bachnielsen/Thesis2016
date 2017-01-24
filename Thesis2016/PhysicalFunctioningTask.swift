////
////  RFTask.swift
////  Thesis2016
////
////  Created by Niclas Bach Nielsen on 10/12/2016.
////  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
////
//
//import Foundation
//import ResearchKit
//
//private var mainQuestion: String {
//    return NSLocalizedString("The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?", comment: "")
//}
//
//public var underQuestion1: String {
//    return NSLocalizedString("Vigorous activities, such as running, lifting heavy objects, participating in strenuous sports", comment: "")
//}
//private var underQuestion2: String {
//    return NSLocalizedString("Moderate activities, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf", comment: "")
//}
//private var underQuestion3: String {
//    return NSLocalizedString("Lifting or carrying groceries", comment: "")
//}
//private var underQuestion4: String {
//    return NSLocalizedString("Climbing several flights of stairs", comment: "")
//}
//private var underQuestion5: String {
//    return NSLocalizedString("Climbing one flight of stairs", comment: "")
//}
//private var underQuestion6: String {
//    return NSLocalizedString("Bending, kneeling, or stooping", comment: "")
//}
//private var underQuestion7: String {
//    return NSLocalizedString("Walking more than a mile", comment: "")
//}
//private var underQuestion8: String {
//    return NSLocalizedString("Walking several blocks", comment: "")
//}
//private var underQuestion9: String {
//    return NSLocalizedString("Walking one block", comment: "")
//}
//private var underQuestion10: String {
//    return NSLocalizedString("Bathing or dressing yourself", comment: "")
//}
//private var underQuestion11 = UILabel()
//
//
//public var PhysicalFunctioningTask: ORKTask {
//    
///*Trying to bold part of question text*/
// 
////    let targetString = "Updated 2012/10/14 21:59 PM"
////    let range = NSMakeRange(7, 12)
////    
////    func attributedString(from string: String, nonBoldRange: NSRange?) -> NSAttributedString {
////        let fontSize = UIFont.systemFontSize
////        let attrs = [
////            NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize),
////            NSForegroundColorAttributeName: UIColor.black
////        ]
////        let nonBoldAttribute = [
////            NSFontAttributeName: UIFont.systemFont(ofSize: fontSize),
////            ]
////        let attrStr = NSMutableAttributedString(string: string, attributes: attrs)
////        if let range = nonBoldRange {
////            attrStr.setAttributes(nonBoldAttribute, range: range)
////        }
////        return attrStr
////    }
//    
////    underQuestion1 = attributedString(from: underQuestion1, nonBoldRange: range)
//    
//    
//    var steps = [ORKStep]()
//    
//    //Instruction step
//    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
//    instructionStep.title = "Physical Functioning"
//    instructionStep.text = "The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?"
//    steps += [instructionStep]
//    
//    
//    //Questionnaire answers
//    let textChoiceOneText = NSLocalizedString("Yes, limited a lot", comment: "")
//    let textChoiceTwoText = NSLocalizedString("Yes, limited a little", comment: "")
//    let textChoiceThreeText = NSLocalizedString("No, not limited at all", comment: "")
//    
//    // The text to display can be separate from the value coded for each choice:
//    let textChoices = [
//        ORKTextChoice(text: textChoiceOneText, value: "choice_1" as NSCoding & NSCopying & NSObjectProtocol),
//        ORKTextChoice(text: textChoiceTwoText, value: "choice_2" as NSCoding & NSCopying & NSObjectProtocol),
//        ORKTextChoice(text: textChoiceThreeText, value: "choice_3" as NSCoding & NSCopying & NSObjectProtocol)
//    ]
//    
//    let answerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
//    
//    let questionStep1 = ORKQuestionStep(identifier: "choiceQuestionStep1", title: "", text: underQuestion1, answer: answerFormat)
//    steps += [questionStep1]
//    let questionStep2 = ORKQuestionStep(identifier: "choiceQuestionStep2", title: "", text: underQuestion2, answer: answerFormat)
//    steps += [questionStep2]
//    let questionStep3 = ORKQuestionStep(identifier: "choiceQuestionStep3", title: "", text: underQuestion3, answer: answerFormat)
//    steps += [questionStep3]
//    let questionStep4 = ORKQuestionStep(identifier: "choiceQuestionStep4", title: "", text: underQuestion4, answer: answerFormat)
//    steps += [questionStep4]
//    let questionStep5 = ORKQuestionStep(identifier: "choiceQuestionStep5", title: "", text: underQuestion5, answer: answerFormat)
//    steps += [questionStep5]
//    let questionStep6 = ORKQuestionStep(identifier: "choiceQuestionStep6", title: "", text: underQuestion6, answer: answerFormat)
//    steps += [questionStep6]
//    let questionStep7 = ORKQuestionStep(identifier: "choiceQuestionStep7", title: "", text: underQuestion7, answer: answerFormat)
//    steps += [questionStep7]
//    let questionStep8 = ORKQuestionStep(identifier: "choiceQuestionStep8", title: "", text: underQuestion8, answer: answerFormat)
//    steps += [questionStep8]
//    let questionStep9 = ORKQuestionStep(identifier: "choiceQuestionStep9", title: "", text: underQuestion9, answer: answerFormat)
//    steps += [questionStep9]
//    let questionStep10 = ORKQuestionStep(identifier: "choiceQuestionStep10", title: "", text: underQuestion10, answer: answerFormat)
//    steps += [questionStep10]
//    
//    let completionStep = ORKOrderedTask.makeCompletionStep()
//    steps += [completionStep]
//    
//    return ORKOrderedTask(identifier: "PhysicalFunctioningTask", steps: steps)
//}
