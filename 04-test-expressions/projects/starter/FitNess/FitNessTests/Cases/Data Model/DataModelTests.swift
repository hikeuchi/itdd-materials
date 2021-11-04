//
//  DataModelTests.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/10/20.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest
@testable import FitNess

class DataModelTests: XCTestCase {
  
  var sut: DataModel!
  
  override func setUp() {
    super.setUp()
    sut = DataModel()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // 目標が達成されるのはステップの数がゴールを超えたとき
  func testModel_whenStepsReachGoal_goalIsReached() {
    // given
    
    sut.goal = 1000
    
    // when
    
    sut.steps = 1000
    
    // then
    
    XCTAssertTrue(sut.goalReached)
  }
  
  // MARK: - Goal
  
  func testModel_whenStarted_goalIsNotReached() {
    XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
  }
  
  // MARK: - Nessie
  
  func testModel_whenStarted_userInNotCaught() {
    XCTAssertFalse(sut.caught)
  }
  
  
}
