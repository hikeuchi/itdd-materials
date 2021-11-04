//
//  RootViewController+Tests.swift
//  FitNessTests
//
//  Created by HIROKI IKEUCHI on 2021/11/04.
//  Copyright © 2021 Razeware. All rights reserved.
//

import UIKit
@testable import FitNess

extension RootViewController {
  var stepController: StepCountController {
    return children.first { $0 is StepCountController }
      as! StepCountController
  }
}

