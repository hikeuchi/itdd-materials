//
//  StepCountControllerTests.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/10/18.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class StepCountControllerTests: XCTestCase {
  
  var sut: StepCountController!
  
  override func setUpWithError() throws {
    
  }
  
  override func tearDownWithError() throws {
    
  }
  
  override func setUp() {
    super.setUp()
    // sut: system under test
    sut = StepCountController()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testController_whenStartTapped_appIsInProgress() {
    sut.startStopPause(nil)
    
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
    
  }
  
  func testController_whenStartTapped_buttonLabelIsPause() {
    sut.startStopPause(nil)

    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
  
}
