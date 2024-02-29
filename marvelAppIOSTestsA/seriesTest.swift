//
//  seriesTest.swift
//  marvelAppIOSTestsA
//
//  Created by Natalia Camero on 28/2/24.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import marvelAppIOS

final class seriesTest: XCTestCase {
    func testSeriesRowsDescriptionText() throws {
        //View configuration
        let series =  SeriesViewModdel().getFakeSerie()
        
        let seriesRowView = SeriesRowView(series: series)
        
        //View inspection
        let view = try seriesRowView.inspect()
        
        let dscriptionText = try view.find(text: series.description ?? "No description available about this serie")
        
        XCTAssertEqual(try dscriptionText.string(), series.description ?? "No description available about this serie")
    }
}
