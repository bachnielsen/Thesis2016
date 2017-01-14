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
    var store: OCKCarePlanStore
    
    override init() {
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
        super.init()
    }
    
    
    
}
