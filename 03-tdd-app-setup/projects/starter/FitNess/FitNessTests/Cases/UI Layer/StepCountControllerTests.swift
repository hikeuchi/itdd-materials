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
  
  // MARK: - Test LifeCycle
  
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
  
  // MARK: - When
  
  fileprivate func whenStartStopPauseCalled() {
    sut.startStopPause(nil)
  }
  
  // MARK: - Initial State
  
  func testController_whenCreated_buttonLabelIsStart() {
    sut.viewDidLoad()
    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.notStarted.nextStateButtonLabel)
  }
  
  // MARK: - In Progress
  
  func testController_whenStartTapped_appIsInProgress() {
    whenStartStopPauseCalled()
    
    let state = AppModel.instance.appState
    XCTAssertEqual(state, AppState.inProgress)
    
  }
  
  func testController_whenStartTapped_buttonLabelIsPause() {
    whenStartStopPauseCalled()

    let text = sut.startButton.title(for: .normal)
    XCTAssertEqual(text, AppState.inProgress.nextStateButtonLabel)
  }
    
}
