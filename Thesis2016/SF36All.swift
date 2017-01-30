//
//  SF36All.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 28/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

private var q1: String {
    return NSLocalizedString("1. In general, would you say your health is:", comment: "")
}
private var q2: String {
    return NSLocalizedString("2. Compared to one year ago, how would you rate your health in general now?", comment: "")
}

// The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?

private var q3: String {
    return NSLocalizedString("3. Vigorous activities, such as running, lifting heavy objects, participating in strenuous sports", comment: "")
}

private var q4: String {
    return NSLocalizedString("4. Moderate activities, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf", comment: "")
}

private var q5: String {
    return NSLocalizedString("5. Lifting or carrying groceries", comment: "")
}

private var q6: String {
    return NSLocalizedString("6. Climbing several flights of stairs", comment: "")
}

private var q7: String {
    return NSLocalizedString("7. Climbing one flight of stairs", comment: "")
}

private var q8: String {
    return NSLocalizedString("8. Bending, kneeling, or stooping", comment: "")
}
private var q9: String {
    return NSLocalizedString("9. Walking more than a mile", comment: "")
}
private var q10: String {
    return NSLocalizedString("10. Walking several blocks", comment: "")
}
private var q11: String {
    return NSLocalizedString("11. Walking one block", comment: "")
}
private var q12: String {
    return NSLocalizedString("12. Bathing or dressing yourself", comment: "")
}

// During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of your physical health?

private var q13: String {
    return NSLocalizedString("13. Cut down the amount of time you spent on work or other activities", comment: "")
}
private var q14: String {
    return NSLocalizedString("14. Accomplished less than you would like", comment: "")
}
private var q15: String {
    return NSLocalizedString("15. Were limited in the kind of work or other activities", comment: "")
}
private var q16: String {
    return NSLocalizedString("16. Had difficulty performing the work or other activities (for example, it took extra effort)", comment: "")
}

//During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of any emotional problems (such as feeling depressed or anxious)?

private var q17: String {
    return NSLocalizedString("17. Cut down the amount of time you spent on work or other activities", comment: "")
}
private var q18: String {
    return NSLocalizedString("18. Accomplished less than you would like", comment: "")
}
private var q19: String {
    return NSLocalizedString("19. Didn't do work or other activities as carefully as usual", comment: "")
}

private var q20: String {
    return NSLocalizedString("20. During the past 4 weeks, to what extent has your physical health or emotional problems interfered with your normal social activities with family, friends, neighbors, or groups?", comment: "")
}
private var q21: String {
    return NSLocalizedString("21. How much bodily pain have you had during the past 4 weeks?", comment: "")
}
private var q22: String {
    return NSLocalizedString("22. During the past 4 weeks, how much did pain interfere with your normal work (including both work outside the home and housework)?", comment: "")
}
// These questions are about how you feel and how things have been with you during the past 4 weeks. For each question, please give the one answer that comes closest to the way you have been feeling.
//How much of the time during the past 4 weeks... All of
private var q23: String {
    return NSLocalizedString("23. Did you feel full of pep?", comment: "")
}
private var q24: String {
    return NSLocalizedString("24. Have you been a very nervous person?", comment: "")
}
private var q25: String {
    return NSLocalizedString("25. Have you felt so down in the dumps that nothing could cheer you up?", comment: "")
}
private var q26: String {
    return NSLocalizedString("26. Have you felt calm and peaceful?", comment: "")
}
private var q27: String {
    return NSLocalizedString("27. Did you have a lot of energy?", comment: "")
}
private var q28: String {
    return NSLocalizedString("28. Have you felt downhearted and blue?", comment: "")
}
private var q29: String {
    return NSLocalizedString("29. Did you feel worn out?", comment: "")
}
private var q30: String {
    return NSLocalizedString("30. Have you been a happy person?", comment: "")
}
private var q31: String {
    return NSLocalizedString("31. Did you feel tired?", comment: "")
}

private var q32: String {
    return NSLocalizedString("32. During the past 4 weeks, how much of the time has your physical health or emotional problems interfered with your social activities (like visiting with friends, relatives, etc.)?", comment: "")
}

// How TRUE or FALSE is each of the following statements for you.

private var q33: String {
    return NSLocalizedString("33. I seem to get sick a little easier than other people", comment: "")
}
private var q34: String {
    return NSLocalizedString("34. I am as healthy as anybody I know", comment: "")
}
private var q35: String {
    return NSLocalizedString("35. I expect my health to get worse", comment: "")
}
private var q36: String {
    return NSLocalizedString("36. My health is excellent", comment: "")
}

public var SF36All: ORKTask {

    var steps = [ORKStep]()
    
    //Instruction step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "SF-36"
    instructionStep.text = "This is your first HRQoL assessment. Choose one option for each questionnaire item. There are 36 questions. Don't worry, it will be over before you can say 'Fim Fam Fum'"
    steps += [instructionStep]
    
    //let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    //instructionStep.title = "Physical Functioning"
    //instructionStep.text = "The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?"
    //steps += [instructionStep]
    
    //Instruction step2
    let instructionStep2 = ORKInstructionStep(identifier: "IntroStep2")
    instructionStep2.title = "First part over."
    instructionStep2.text = "The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?"
    //steps += [instructionStep2]
    
    //Instruction step3
        let instructionStep3 = ORKInstructionStep(identifier: "IntroStep3")
        instructionStep3.title = "Great! Continue going."
        instructionStep3.text = "During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of your physical health?"
        //steps += [instructionStep3]
    
    //Instruction step4
    let instructionStep4 = ORKInstructionStep(identifier: "IntroStep4")
    instructionStep4.title = "Great! Continue going."
    instructionStep4.text = "During the past 4 weeks, have you had any of the following problems with your work or other regular daily activities as a result of any emotional problems (such as feeling depressed or anxious)?"
    //steps += [instructionStep4]

    //Instruction step5
    let instructionStep5 = ORKInstructionStep(identifier: "IntroStep5")
    instructionStep5.title = "Great! Continue going."
    instructionStep5.text = "These questions are about how you feel and how things have been with you during the past 4 weeks. For each question, please give the one answer that comes closest to the way you have been feeling. How much of the time during the past 4 weeks..."
    //steps += [instructionStep5]
    
    //Instruction step6
    let instructionStep6 = ORKInstructionStep(identifier: "IntroStep6")
    instructionStep6.title = "Last sprint! Good job."
    instructionStep6.text = "How TRUE or FALSE is each of the following statements for you."
    //steps += [instructionStep6]
    
    
    //Instruction step2
    //    let instructionStep2 = ORKInstructionStep(identifier: "IntroStep2")
    //    instructionStep2.title = "LOL Functioning"
    //    instructionStep2.text = "The following items are about activities you might do during a typical day. Does your health now limit you in these activities? If so, how much?"
    //    steps += [instructionStep2]
    
    
    //Questionnaire answers
    
    //Q1
    let q1FiveChoices1 = NSLocalizedString("Excellent", comment: "")
    let q1FiveChoices2 = NSLocalizedString("Very good", comment: "")
    let q1FiveChoices3 = NSLocalizedString("Good", comment: "")
    let q1FiveChoices4 = NSLocalizedString("Fair", comment: "")
    let q1FiveChoices5 = NSLocalizedString("Poor", comment: "")
    
    let q1TextChoices = [
        ORKTextChoice(text: q1FiveChoices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q1FiveChoices2, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q1FiveChoices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q1FiveChoices4, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q1FiveChoices5, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ1 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q1TextChoices)
    
    //Q2
    let q2FiveChoices1 = NSLocalizedString("Much better now than one year ago", comment: "")
    let q2FiveChoices2 = NSLocalizedString("Somewhat better now than one year ago", comment: "")
    let q2FiveChoices3 = NSLocalizedString("About the same", comment: "")
    let q2FiveChoices4 = NSLocalizedString("Somewhat worse now than one year ago", comment: "")
    let q2FiveChoices5 = NSLocalizedString("Much worse now than one year ago", comment: "")
    
    let q2TextChoices = [
        ORKTextChoice(text: q2FiveChoices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2FiveChoices2, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2FiveChoices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2FiveChoices4, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2FiveChoices5, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ2 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q2TextChoices)
    
    //Q3-Q12
    let q3q12Choices1 = NSLocalizedString("Yes, limited a lot", comment: "")
    let q3q12Choices2 = NSLocalizedString("Yes, limited a little", comment: "")
    let q3q12Choices3 = NSLocalizedString("No, not limited at all", comment: "")
    
    // The text to display can be separate from the value coded for each choice:
    let q3q12TextChoices = [
        ORKTextChoice(text: q3q12Choices1, value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3q12Choices2, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3q12Choices3, value: 100 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    let answerFormatQ3Q12 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q3q12TextChoices)
    
    //Q13-Q19
    let boolChoice = ORKAnswerFormat.booleanAnswerFormat()
    
    //Q20
    let q20Choices1 = NSLocalizedString("Not at all", comment: "")
    let q20Choices2 = NSLocalizedString("Slightly", comment: "")
    let q20Choices3 = NSLocalizedString("Moderately", comment: "")
    let q20Choices4 = NSLocalizedString("Quite a bit", comment: "")
    let q20Choices5 = NSLocalizedString("Extremely", comment: "")
    
    let q20TextChoices = [
        ORKTextChoice(text: q20Choices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q20Choices2, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q20Choices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q20Choices4, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q20Choices5, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ20 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q20TextChoices)
    
    //q21
    let q21Choices1 = NSLocalizedString("None", comment: "")
    let q21Choices2 = NSLocalizedString("Very mild", comment: "")
    let q21Choices3 = NSLocalizedString("Mild", comment: "")
    let q21Choices4 = NSLocalizedString("Moderate", comment: "")
    let q21Choices5 = NSLocalizedString("Severe", comment: "")
    let q21Choices6 = NSLocalizedString("Very severe", comment: "")
    
    let q21TextChoices = [
        ORKTextChoice(text: q21Choices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q21Choices2, value: 80 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q21Choices3, value: 60 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q21Choices4, value: 40 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q21Choices5, value: 20 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q21Choices6, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ21 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q21TextChoices)
    
    //q22
    let q22Choices1 = NSLocalizedString("Not at all", comment: "")
    let q22Choices2 = NSLocalizedString("A little bit", comment: "")
    let q22Choices3 = NSLocalizedString("Moderately", comment: "")
    let q22Choices4 = NSLocalizedString("Quite a bit", comment: "")
    let q22Choices5 = NSLocalizedString("Extremely", comment: "")
    
    let q22TextChoices = [
        ORKTextChoice(text: q22Choices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q22Choices2, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q22Choices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q22Choices4, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q22Choices5, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ22 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q22TextChoices)
    
    //Q23-31
    let q2331Choices1 = NSLocalizedString("All of the time", comment: "")
    let q2331Choices2 = NSLocalizedString("Most of the time", comment: "")
    let q2331Choices3 = NSLocalizedString("A good bit of the time", comment: "")
    let q2331Choices4 = NSLocalizedString("Some of the time", comment: "")
    let q2331Choices5 = NSLocalizedString("A little of the time", comment: "")
    let q2331Choices6 = NSLocalizedString("None of the time", comment: "")
    
    let q2331TextChoices1 = [
        ORKTextChoice(text: q2331Choices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices2, value: 80 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices3, value: 60 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices4, value: 40 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices5, value: 20 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices6, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let q2331TextChoices2 = [
        ORKTextChoice(text: q2331Choices1, value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices2, value: 20 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices3, value: 40 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices4, value: 60 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices5, value: 80 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q2331Choices6, value: 100 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ2331_v1 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q2331TextChoices1)
    let answerFormatQ2331_v2 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q2331TextChoices2)
    
    //q32
    let q32Choices1 = NSLocalizedString("All of the time", comment: "")
    let q32Choices2 = NSLocalizedString("Most of the time", comment: "")
    let q32Choices3 = NSLocalizedString("Some of the time", comment: "")
    let q32Choices4 = NSLocalizedString("A little of the time", comment: "")
    let q32Choices5 = NSLocalizedString("None of the time", comment: "")
    
    let q32TextChoices = [
        ORKTextChoice(text: q32Choices1, value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q32Choices2, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q32Choices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q32Choices4, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q32Choices5, value: 100 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ32 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q32TextChoices)
    
    //q33-q36
    let q3336Choices1 = NSLocalizedString("Definitely true", comment: "")
    let q3336Choices2 = NSLocalizedString("Mostly true", comment: "")
    let q3336Choices3 = NSLocalizedString("Don't know", comment: "")
    let q3336Choices4 = NSLocalizedString("Mostly false", comment: "")
    let q3336Choices5 = NSLocalizedString("Definitely false", comment: "")
    
    let q3336TextChoices1 = [
        ORKTextChoice(text: q3336Choices1, value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices2, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices4, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices5, value: 100 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let q3336TextChoices2 = [
        ORKTextChoice(text: q3336Choices1, value: 100 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices2, value: 75 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices3, value: 50 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices4, value: 25 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: q3336Choices5, value: 0 as NSCoding & NSCopying & NSObjectProtocol)
    ]
    
    let answerFormatQ3336_v1 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q3336TextChoices1)
    let answerFormatQ3336_v2 = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: q3336TextChoices2)
    
    
    
    let questionStep1 = ORKQuestionStep(identifier: "idQ1", title: "", text: q1, answer: answerFormatQ1)
    steps += [questionStep1]
    let questionStep2 = ORKQuestionStep(identifier: "idQ2", title: "", text: q2, answer: answerFormatQ2)
    steps += [questionStep2]
    
    steps += [instructionStep2]
    
    let questionStep3 = ORKQuestionStep(identifier: "idQ3", title: "", text: q3, answer: answerFormatQ3Q12)
    steps += [questionStep3]
    let questionStep4 = ORKQuestionStep(identifier: "idQ4", title: "", text: q4, answer: answerFormatQ3Q12)
    steps += [questionStep4]
    let questionStep5 = ORKQuestionStep(identifier: "idQ5", title: "", text: q5, answer: answerFormatQ3Q12)
    steps += [questionStep5]
    let questionStep6 = ORKQuestionStep(identifier: "idQ6", title: "", text: q6, answer: answerFormatQ3Q12)
    steps += [questionStep6]
    let questionStep7 = ORKQuestionStep(identifier: "idQ7", title: "", text: q7, answer: answerFormatQ3Q12)
    steps += [questionStep7]
    let questionStep8 = ORKQuestionStep(identifier: "idQ8", title: "", text: q8, answer: answerFormatQ3Q12)
    steps += [questionStep8]
    let questionStep9 = ORKQuestionStep(identifier: "idQ9", title: "", text: q9, answer: answerFormatQ3Q12)
    steps += [questionStep9]
    let questionStep10 = ORKQuestionStep(identifier: "idQ10", title: "", text: q10, answer: answerFormatQ3Q12)
    steps += [questionStep10]
    let questionStep11 = ORKQuestionStep(identifier: "idQ11", title: "", text: q11, answer: answerFormatQ3Q12)
    steps += [questionStep11]
    let questionStep12 = ORKQuestionStep(identifier: "idQ12", title: "", text: q12, answer: answerFormatQ3Q12)
    steps += [questionStep12]
    
    steps += [instructionStep3]
    
    let questionStep13 = ORKQuestionStep(identifier: "idQ13", title: "", text: q13, answer: boolChoice)
    steps += [questionStep13]
    let questionStep14 = ORKQuestionStep(identifier: "idQ14", title: "", text: q14, answer: boolChoice)
    steps += [questionStep14]
    let questionStep15 = ORKQuestionStep(identifier: "idQ15", title: "", text: q15, answer: boolChoice)
    steps += [questionStep15]
    let questionStep16 = ORKQuestionStep(identifier: "idQ16", title: "", text: q16, answer: boolChoice)
    steps += [questionStep16]
    
    steps += [instructionStep4]
    
    let questionStep17 = ORKQuestionStep(identifier: "idQ17", title: "", text: q17, answer: boolChoice)
    steps += [questionStep17]
    let questionStep18 = ORKQuestionStep(identifier: "idQ18", title: "", text: q18, answer: boolChoice)
    steps += [questionStep18]
    let questionStep19 = ORKQuestionStep(identifier: "idQ19", title: "", text: q19, answer: boolChoice)
    steps += [questionStep19]
    let questionStep20 = ORKQuestionStep(identifier: "idQ20", title: "", text: q20, answer: answerFormatQ20)
    steps += [questionStep20]
    let questionStep21 = ORKQuestionStep(identifier: "idQ21", title: "", text: q21, answer: answerFormatQ21)
    steps += [questionStep21]
    let questionStep22 = ORKQuestionStep(identifier: "idQ22", title: "", text: q22, answer: answerFormatQ22)
    steps += [questionStep22]
    
    steps += [instructionStep5]
    
    let questionStep23 = ORKQuestionStep(identifier: "idQ23", title: "How much of the time during the past 4 weeks...", text: q23, answer: answerFormatQ2331_v1)
    steps += [questionStep23]
    let questionStep24 = ORKQuestionStep(identifier: "idQ24", title: "How much of the time during the past 4 weeks...", text: q24, answer: answerFormatQ2331_v2)
    steps += [questionStep24]
    let questionStep25 = ORKQuestionStep(identifier: "idQ25", title: "How much of the time during the past 4 weeks...", text: q25, answer: answerFormatQ2331_v2)
    steps += [questionStep25]
    let questionStep26 = ORKQuestionStep(identifier: "idQ26", title: "How much of the time during the past 4 weeks...", text: q26, answer: answerFormatQ2331_v1)
    steps += [questionStep26]
    let questionStep27 = ORKQuestionStep(identifier: "idQ27", title: "How much of the time during the past 4 weeks...", text: q27, answer: answerFormatQ2331_v1)
    steps += [questionStep27]
    let questionStep28 = ORKQuestionStep(identifier: "idQ28", title: "How much of the time during the past 4 weeks...", text: q28, answer: answerFormatQ2331_v2)
    steps += [questionStep28]
    let questionStep29 = ORKQuestionStep(identifier: "idQ29", title: "How much of the time during the past 4 weeks...", text: q29, answer: answerFormatQ2331_v2)
    steps += [questionStep29]
    let questionStep30 = ORKQuestionStep(identifier: "idQ30", title: "How much of the time during the past 4 weeks...", text: q30, answer: answerFormatQ2331_v1)
    steps += [questionStep30]
    let questionStep31 = ORKQuestionStep(identifier: "idQ31", title: "How much of the time during the past 4 weeks...", text: q31, answer: answerFormatQ2331_v2)
    steps += [questionStep31]
    let questionStep32 = ORKQuestionStep(identifier: "idQ32", title: "", text: q32, answer: answerFormatQ32)
    steps += [questionStep32]
    
    steps += [instructionStep6]
    
    let questionStep33 = ORKQuestionStep(identifier: "idQ33", title: "", text: q33, answer: answerFormatQ3336_v1)
    steps += [questionStep33]
    let questionStep34 = ORKQuestionStep(identifier: "idQ34", title: "", text: q34, answer: answerFormatQ3336_v2)
    steps += [questionStep34]
    let questionStep35 = ORKQuestionStep(identifier: "idQ35", title: "", text: q35, answer: answerFormatQ3336_v1)
    steps += [questionStep35]
    let questionStep36 = ORKQuestionStep(identifier: "idQ36", title: "", text: q36, answer: answerFormatQ3336_v2)
    steps += [questionStep36]
    
    let completionStep = ORKOrderedTask.makeCompletionStep()
    
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "SF36All", steps: steps)
    
    
}
