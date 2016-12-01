//
//  HealthManager.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 30/11/2016.
//  Copyright © 2016 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit
import HealthKit

class HealthManager{
    
    let healthKitStore:HKHealthStore = HKHealthStore()
    
    func authorizeHealthKit(completion: ((_ success: Bool, _ error: NSError?) -> Void)!){
        // 1. Set the types you want to read from HK Store
        
        let healthKitTypesToRead: Set<HKObjectType> = [
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)!,
            HKObjectType.characteristicType(forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
            HKQuantityType.workoutType()
        ]
        
        // 2. Set the types you want to write to HK Store
        let healthKitTypesToWrite: Set<HKSampleType> = [
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)!,
            HKQuantityType.workoutType()
        ]

        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if !HKHealthStore.isHealthDataAvailable()
        {
            let error = NSError(domain: "m.Thesis2016", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
            if( completion != nil )
            {
                completion(false, error)
            }
            return;
        }
        
        
        // 4.  Request HealthKit authorization
        
        
        self.healthKitStore.requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) -> Void in
            
            //completion?(success, error as? NSError)
            completion(success, error as? NSError)
        }
        
    }
}
