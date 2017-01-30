//
//  LineGraphDataSource.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 28/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import Foundation
import ResearchKit

class LineGraphDataSource: NSObject, ORKValueRangeGraphChartViewDataSource {
    // MARK: Properties
    
    var plotPoints =
        [
            [
                ORKValueRange(value: 10),
                ORKValueRange(value: 20),
                ORKValueRange(value: 25),
                ORKValueRange(),
                ORKValueRange(value: 30),
                ORKValueRange(value: 40),
                ],
            [
                ORKValueRange(value: 2),
                ORKValueRange(value: 4),
                ORKValueRange(value: 8),
                ORKValueRange(value: 16),
                ORKValueRange(value: 32),
                ORKValueRange(value: 64),
                ]
    ]
    
    // MARK: ORKGraphChartViewDataSource
    
    func numberOfPlots(in graphChartView: ORKGraphChartView) -> Int {
        return plotPoints.count
    }
    
    func graphChartView(_ graphChartView: ORKGraphChartView, dataPointForPointIndex pointIndex: Int, plotIndex: Int) -> ORKValueRange {
        return plotPoints[plotIndex][pointIndex]
    }
    
    func graphChartView(_ graphChartView: ORKGraphChartView, numberOfDataPointsForPlotIndex plotIndex: Int) -> Int {
        return plotPoints[plotIndex].count
    }
    
    func maximumValue(for graphChartView: ORKGraphChartView) -> Double {
        return 70
    }
    
    func minimumValue(for graphChartView: ORKGraphChartView) -> Double {
        return 0
    }
    
    func graphChartView(_ graphChartView: ORKGraphChartView, titleForXAxisAtPointIndex pointIndex: Int) -> String? {
        return "\(pointIndex + 1)"
    }
}
