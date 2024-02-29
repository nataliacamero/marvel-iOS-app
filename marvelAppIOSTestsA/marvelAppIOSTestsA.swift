//
//  marvelAppIOSTestsA.swift
//  marvelAppIOSTestsA
//
//  Created by Natalia Camero on 23/2/24.
//

import XCTest
import SwiftUI
import ViewInspector

@testable import marvelAppIOS

final class marvelAppIOSTestsA: XCTestCase {
    
    func testFindTextMarvel() throws {
        //Configure the RootViemodel object
        let rootViewModel = RootViewModel(test: true)
        let charactersData = CharactersData(offset: 0, limit: 0, total: 0, count: 0, results: [hero1, hero2])
        rootViewModel.dataCharacters = ModelMarvel(code: 200, status: "success", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: charactersData)
        
        //create the view
        let charactersListView = CharactersListView().environmentObject(rootViewModel)

        //Inspect the view with ViewInspector
        let view = try charactersListView.inspect()
        
        let oneText = try view.find(text: "MARVEL")
        
        XCTAssertEqual(try oneText.string(), "MARVEL")
    }
    
    func testFindANavigationStack() throws {
        //create the view
        let charactersListView = CharactersListView().environmentObject(RootViewModel(test: true))

        //Inspect the view with ViewInspector
        let navigationStack = try charactersListView.inspect().find(ViewType.NavigationStack.self)
        
        XCTAssertNotNil(navigationStack)
    }
    
    func testFindAListView() throws {
        //create the view
        let charactersListView = CharactersListView().environmentObject(RootViewModel(test: true))

        //Inspect the view with ViewInspector
        let listView = try charactersListView.inspect().find(ViewType.List.self)
        
        //Assert
        XCTAssertNotNil(listView)
    }
    
    func testIsThereOneHero() throws {
        //Configure the RootViemodel object
        let rootViewModel = RootViewModel(test: true)
        let charactersData = CharactersData(offset: 0, limit: 0, total: 0, count: 0, results: [hero1])
        rootViewModel.dataCharacters = ModelMarvel(code: 200, status: "success", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: charactersData)
        
        //create the view
        let charactersListView = CharactersListView().environmentObject(rootViewModel)
        
        //Inspect the view with ViewInspector
        let listView = try charactersListView.inspect().find(ViewType.List.self)
        
        let oneText = try listView.find(text: "Hulk")

        //Assert
        XCTAssertEqual(try oneText.string(), "Hulk")
    }
    
    func testIsThereTwoHeros() throws {
        //Configure the RootViemodel object
        let rootViewModel = RootViewModel(test: true)
        let charactersData = CharactersData(offset: 0, limit: 0, total: 0, count: 0, results: [hero1, hero2])
        rootViewModel.dataCharacters = ModelMarvel(code: 200, status: "success", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: charactersData)
        
        //create the view
        let charactersListView = CharactersListView().environmentObject(rootViewModel)
        
        //Inspect the view with ViewInspector        
        let listView = try charactersListView.inspect().find(ViewType.List.self)
        
        //We bring the heros
        let hulkText = try listView.find(text: "Hulk")
        let avengersText = try listView.find(text: "Avengers")

        //Assert
        XCTAssertEqual(try hulkText.string(), "Hulk")
        XCTAssertEqual(try avengersText.string(), "Avengers")
    }
}
