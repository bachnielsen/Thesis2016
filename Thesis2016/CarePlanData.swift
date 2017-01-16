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
    
    class func dailyScheduleRepeating(occurencesPerDay: UInt) -> OCKCareSchedule {
        return OCKCareSchedule.dailySchedule(withStartDate: DateComponents.firstDateOfCurrentWeek,
                                             occurrencesPerDay: occurencesPerDay)
    }
    
    init(carePlanStore: OCKCarePlanStore) {
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
            title: "Questions taken",
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
}
