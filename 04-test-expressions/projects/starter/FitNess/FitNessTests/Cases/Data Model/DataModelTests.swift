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
  
  // MARK: - Goal
  
  func testModel_whenStarted_goalIsNotReached() {
    XCTAssertFalse(sut.goalReached, "goalReached should be false when the model is created")
  }
  
}
