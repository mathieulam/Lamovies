//
//  LamoviesTests.swift
//  LamoviesTests
//
//  Created by Mathieu Lamvohee on 15/02/2018.
//  Copyright © 2018 Mathieu Lamvohee. All rights reserved.
//

import XCTest
@testable import Lamovies

class LamoviesTests: XCTestCase {
    var mainViewController: MainViewController!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: MainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainViewController = vc
        _ = mainViewController.view
        UIApplication.shared.keyWindow?.rootViewController = mainViewController
        
    }
    
    func testSearchButtonIsInitialized() {
        
        XCTAssertNotNil(mainViewController.searchButton)
    }
    
    func testSearchButtonIsLabelledCompleteAndLog() {
        
        XCTAssert(mainViewController.searchButton?.titleLabel?.text
            == "Search")
    }
    
    func testSearchButtonIsWiredToAction() {
        
        let actions = buttonActions(button: mainViewController.searchButton)
        
        XCTAssertNotNil(actions)
        if let actions = actions {
            XCTAssert(actions.count > 0)
            XCTAssert(actions.contains("searchButtonClicked:"))
        }
    }
    
    func buttonActions(button: UIButton?) -> [String]? {
        
        return button?.actions(forTarget: mainViewController, forControlEvent: .touchUpInside) as? [String]
    }
    
    func testShowPopup() {
        
        mainViewController.movieTitleTextField.text = ""
        mainViewController.searchButton.sendActions(for: UIControlEvents.touchUpInside)
        
        XCTAssertTrue(mainViewController.presentedViewController is UIAlertController)
        XCTAssertEqual(mainViewController.presentedViewController?.title, "Hey There!")
       
    }
    
    func testShowList() {
        mainViewController.movieTitleTextField.text = "Batman"
        mainViewController.searchButton.sendActions(for: UIControlEvents.touchUpInside)
        
        XCTAssertTrue(mainViewController.presentedViewController is MovieListViewController)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        mainViewController = nil
    }
    
}
