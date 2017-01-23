//
//  OCKInsightItem.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 20/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import CareKit

extension OCKInsightItem {
    static func emptyInsightsMessage() -> OCKInsightItem {
        return OCKMessageItem(title: "No Insights", text: "There are no insights to show.", tintColor: Colors.blue.color, messageType: .tip)
    }
}
