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
  
  func testGoal_whenUserCaught_cannotBeReached() {
    //given goal should be reached
    sut.goal = 1000
    sut.steps = 1000

    // when caught by nessie
    sut.distance = 100
    sut.nessie.distance = 100

    // then
    XCTAssertFalse(sut.goalReached)
  }
  
  // MARK: - Nessie
  
  func testModel_whenStarted_userInNotCaught() {
    XCTAssertFalse(sut.caught)
  }
  
  func testModel_whenUserAheadOfNessie_isNotCaught() {
    // given
    sut.distance = 1000
    sut.nessie.distance = 100
    
    // then
    XCTAssertFalse(sut.caught)
  }
  
  func testModel_whenNessieIsAheadOfUser_isCaught() {
    // given
    sut.distance = 100
    sut.nessie.distance = 1000
    
    // then
    XCTAssertTrue(sut.caught)
  }
  
}
