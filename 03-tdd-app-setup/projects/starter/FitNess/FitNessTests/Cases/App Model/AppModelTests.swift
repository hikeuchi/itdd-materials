//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/10/18.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class AppModelTests: XCTestCase {
  
  var sut: AppModel!
  
  override func setUpWithError() throws {
    
  }
  
  override func tearDownWithError() throws {

  }
  
  override func setUp() {
    super.setUp()
    // sut: system under test
    sut = AppModel()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testAppModel_whenInitialized_isInNotStartedState() {
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }
  
  func testAppModel_whenStarted_isInInPrrogressState() {
    sut.start()
    let observedState = sut.appState
    XCTAssertEqual(observedState, AppState.inProgress)
  }
  
  
}
