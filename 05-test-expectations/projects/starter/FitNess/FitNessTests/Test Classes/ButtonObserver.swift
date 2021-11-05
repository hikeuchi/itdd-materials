//
//  ButtonObserver.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/11/05.
//  Copyright © 2021 Razeware. All rights reserved.
//

import XCTest

class ButtonObserver: NSObject {

  var expectation: XCTestExpectation?
  weak var button: UIButton?

  func observe(_ button: UIButton,
               expectation: XCTestExpectation) {
    self.expectation = expectation
    self.button = button

    // KVOで
    // UIButtonのtitleLabel.textの変更を監視する
    button.addObserver(self,
                       forKeyPath: "titleLabel.text",
                       options: [.new],
                       context: nil)
  }
  
  override func observeValue(
    forKeyPath keyPath: String?,
    of object: Any?,
    change: [NSKeyValueChangeKey : Any]?,
    context: UnsafeMutableRawPointer?) {
    expectation?.fulfill()
  }

  deinit {
    button?.removeObserver(self, forKeyPath: "titleLabel.text")
  }
}

