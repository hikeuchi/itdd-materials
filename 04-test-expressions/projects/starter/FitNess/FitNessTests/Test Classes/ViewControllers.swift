//
//  ViewControllers.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/11/04.
//  Copyright © 2021 Razeware. All rights reserved.
//

import UIKit
@testable import FitNess

func loadRootViewController() -> RootViewController {
  let window = UIApplication.shared.windows[0]
  return window.rootViewController as! RootViewController
}
