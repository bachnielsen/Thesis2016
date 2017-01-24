//
//  CarePlanData.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 15/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import CareKit

enum ActivityIdentifier: String {
    case medication
    case questions
    case walking
}

class CarePlanData: NSObject {
    let carePlanStore: OCKCarePlanStore
    
//    let contacts: [OCKContact] = [
//        OCKContact(contactType: .careTeam,
//                   name: "Dr. Maria Ruiz",
//                   relation: "Physician",
//                   contactInfoItems:[.phone("888-555-5512"), .sms("888-555-5512"), .email("mruiz2@mac.com")],
//                   tintColor: Colors.blue.color,
//                   monogram: "MR",
//                   image: nil),
//        
//        OCKContact(contactType: .careTeam,
//                   name: "Bill James",
//                   relation: "Nurse",
//                   contactInfoItems:[.phone("888-555-5512"), .sms("888-555-5512"), .email("billjames2@mac.com")],
//                   tintColor: Colors.green.color,
//                   monogram: nil,
//                   image: nil),
//        
//        OCKContact(contactType: .personal,
//                   name: "Tom Clark",
//                   relation: "Father",
//                   contactInfoItems:[.phone("888-555-5512"), .sms("888-555-5512"), .facetimeVideo("8885555512", display: "888-555-5512")],
//                   tintColor: Colors.yellow.color,
//                   monogram: nil,
//                   image: nil)
//    ]
//    let newContact = OCKContact(contactType: .careTeam,
//                                name: "Bill James",
//                                relation: "Nurse",
//                                tintColor: Colors.green.color,
//                                phoneNumber: CNPhoneNumber(stringValue: "888-555-5512"),
//                                messageNumber: CNPhoneNumber(stringValue: "888-555-5512"),
//                                emailAddress: "billjames@example.com",
//                                monogram: "BJ",
//                                image: nil)
    let contacts =
        [OCKContact(contactType: .personal,
                    name: "Daniel Hansen",
                    relation: "Son",
                    tintColor: nil,
                    phoneNumber: CNPhoneNumber(stringValue: "888-555-5512"),
                    messageNumber: CNPhoneNumber(stringValue: "888-555-5512"),
                    emailAddress: "shaunofthedead@example.com",
                    monogram: "DH",
                    image: UIImage(named: "son") as UIImage?),
         OCKContact(contactType: .personal,
                    name: "Lotte Ringsted",
                    relation: "Wife",
                    tintColor: nil,
                    phoneNumber: CNPhoneNumber(stringValue: "888-555-5235"),
                    messageNumber: CNPhoneNumber(stringValue: "888-555-5235"),
                    emailAddress: "wife@example.com",
                    monogram: "LR",
                    image: UIImage(named: "wife") as UIImage?),
         OCKContact(contactType: .careTeam,
                    name: "Dr Gertrud Hansen",
                    relation: "Doctor",
                    tintColor: nil,
                    phoneNumber: CNPhoneNumber(stringValue: "888-555-2351"),
                    messageNumber: CNPhoneNumber(stringValue: "888-555-2351"),
                    emailAddress: "dr.gertrud@example.com",
                    monogram: "GH",
                    image: UIImage(named: "nurse") as UIImage?)]
    
    
    class func dailyScheduleRepeating(occurencesPerDay: UInt) -> OCKCareSchedule {
        return OCKCareSchedule.dailySchedule(withStartDate: DateComponents.firstDateOfCurrentWeek,
                                             occurrencesPerDay: occurencesPerDay)
    }
    
    required init(carePlanStore: OCKCarePlanStore) {
        self.carePlanStore = carePlanStore
        
        //TODO: Define intervention activities
        
        let medicationActivity = OCKCarePlanActivity(
            identifier: ActivityIdentifier.medication.rawValue,
            groupIdentifier: nil,
            type: .intervention,
            title: "Bisoprolol (Zebeta)",
            text: "four times a day",
            tintColor: Colors.green.color,
            instructions: "Take your medication as prescribed, four times daily. Morning, late morning, afternoon and evening.",
            imageURL: nil,
            schedule:CarePlanData.dailyScheduleRepeating(occurencesPerDay: 4),
            resultResettable: true,
            userInfo: nil)
        
        let questionsActivity = OCKCarePlanActivity(
            identifier: ActivityIdentifier.questions.rawValue,
            groupIdentifier: nil,
            type: .intervention,
            title: "Questions answered",
            text: nil,
            tintColor: Colors.blue.color,
            instructions: "It is adviseable to answer questions regarding your health daily, to get a better understanding of your health related quality of life.",
            imageURL: nil,
            schedule:CarePlanData.dailyScheduleRepeating(occurencesPerDay: 2),
            resultResettable: true,
            userInfo: nil)
        
        let walkingActivity = OCKCarePlanActivity(
            identifier: ActivityIdentifier.walking.rawValue,
            groupIdentifier: nil,
            type: .intervention,
            title: "Walking",
            text: "500 meters",
            tintColor: Colors.yellow.color,
            instructions: "Take a 500 meters walk around the block. Exercise is great for your health and walking can positively impact your condition.",
            imageURL: nil,
            schedule:CarePlanData.dailyScheduleRepeating(occurencesPerDay: 2),
            resultResettable: true,
            userInfo: nil)
        
        //TODO: Define assessment activities
        
        super.init()
        
        //TODO: Add activities to store
        
        for activity in [medicationActivity, questionsActivity, walkingActivity] {
                            add(activity: activity)
        }
        
        
        
    }
    
    func add(activity: OCKCarePlanActivity) {
        carePlanStore.activity(forIdentifier: activity.identifier) {
            [weak self] (success, fetchedActivity, error) in
            guard success else { return }
            guard let strongSelf = self else { return }
            
            if let _ = fetchedActivity { return }
            
            strongSelf.carePlanStore.add(activity, completion: { _ in })
        }
    }
    func generateSampleDocument() -> OCKDocument {
        let subtitle = OCKDocumentElementSubtitle(subtitle: "First subtitle")
        
        let paragraph = OCKDocumentElementParagraph(content: "Lorem ipsum dolor sit amet, vim primis noster sententiae ne, et albucius apeirian accusata mea, vim at dicunt laoreet. Eu probo omnes inimicus ius, duo at veritus alienum. Nostrud facilisi id pro. Putant oporteat id eos. Admodum antiopam mel in, at per everti quaeque. Lorem ipsum dolor sit amet, vim primis noster sententiae ne, et albucius apeirian accusata mea, vim at dicunt laoreet. Eu probo omnes inimicus ius, duo at veritus alienum. Nostrud facilisi id pro. Putant oporteat id eos. Admodum antiopam mel in, at per everti quaeque. Lorem ipsum dolor sit amet, vim primis noster sententiae ne, et albucius apeirian accusata mea, vim at dicunt laoreet. Eu probo omnes inimicus ius, duo at veritus alienum. Nostrud facilisi id pro. Putant oporteat id eos. Admodum antiopam mel in, at per everti quaeque.")
        
        let document = OCKDocument(title: "Sample Document Title", elements: [subtitle, paragraph])
        document.pageHeader = "App Name: OCKSample, User Name: John Appleseed"
        
        return document
    }
}
