//
//  AppModelTests.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/10/18.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
import FitNess

class AppModelTests: XCTestCase {
  
  override func setUpWithError() throws {
    
  }
  
  override func tearDownWithError() throws {
    
  }
  
  func testAppModel_whenInitialized_isInNotStartedState() {
    // sut: system under test
    let sut = AppModel()
    let initialState = sut.appState
    XCTAssertEqual(initialState, AppState.notStarted)
  }
  
  func testAppModel_whenStarted_isInInPrrogressState() {
    let sut = AppModel()
    sut.start()
    let observedState = sut.appState
    XCTAssertEqual(observedState, AppState.inProgress)
  }
  
  
}
