//
//  NSDateComponents.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 15/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import Foundation

extension DateComponents {
    static var firstDateOfCurrentWeek: DateComponents {
        var beginningOfWeek: NSDate?
        
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        gregorian?.locale = Locale.current
        gregorian!.range(of: .weekOfYear, start: &beginningOfWeek, interval: nil, for: Date())
        let dateComponents = gregorian?.components([.era, .year, .month, .day],
                                                   from: beginningOfWeek! as Date)
        return dateComponents!
    }
}
