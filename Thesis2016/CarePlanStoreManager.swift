//
//  CarePlanStoreManager.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 14/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import CareKit
import ResearchKit

class CarePlanStoreManager: NSObject {
    // MARK: Static Properties
    
    static var sharedCarePlanStoreManager = CarePlanStoreManager()
    let store: OCKCarePlanStore
    
//    var insights: [OCKInsightItem] {
//        return insightsBuilder.insights
//    }
//    
//    fileprivate let insightsBuilder: InsightsBuilder

    fileprivate override init() {
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).last else {
            fatalError("*** Error: Unable to get the document directory! ***")
        }
        
        let storeURL = documentDirectory.appendingPathComponent("MyCareKitStore")
        
        if !fileManager.fileExists(atPath: storeURL.path) {
            try! fileManager.createDirectory(at: storeURL, withIntermediateDirectories: true, attributes: nil)
        }
        
        // Create the store (CarePlanStore)
        store = OCKCarePlanStore(persistenceDirectoryURL: storeURL)
        
//        insightsBuilder = InsightsBuilder(carePlanStore: store)
        
        super.init()
        
        // Register this object as the store's delegate to be notified of changes.
//        store.delegate = self
        
//        // Start to build the initial array of insights.
//        updateInsights()
    }
    
//    func updateInsights() {
//        insightsBuilder.updateInsights { [weak self] completed, newInsights in
//            // If new insights have been created, notifiy the delegate.
//            guard let storeManager = self, let newInsights = newInsights , completed else { return }
//            storeManager.delegate?.carePlanStoreManager(storeManager, didUpdateInsights: newInsights)
//        }
//    }
}

//extension CarePlanStoreManager: OCKCarePlanStoreDelegate {
//    func carePlanStoreActivityListDidChange(_ store: OCKCarePlanStore) {
//        updateInsights()
//    }
//    
//    func carePlanStore(_ store: OCKCarePlanStore, didReceiveUpdateOf event: OCKCarePlanEvent) {
//        updateInsights()
//    }
//}
//
//
//
//protocol CarePlanStoreManagerDelegate: class {
//    
//    func carePlanStoreManager(_ manager: CarePlanStoreManager, didUpdateInsights insights: [OCKInsightItem])
//    
//}
