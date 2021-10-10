/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import XCTest


class CashRegister {
    
    // MARK: - Properties
        
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    // MARK: - Lifecycle
        
    init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
        
    // MARK: - Helpers
    
    func addItem(_ cost: Decimal) {
        transactionTotal = cost
    }
    
}


class CashRegisterTests: XCTestCase {
    
    var availableFunds: Decimal!
    var sut: CashRegister!
    
    override func setUp() {
        super.setUp()
        availableFunds = 100
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    override func tearDown() {
        super.tearDown()
        // テスト中は同じインスタンスが使われるのでsetUp()で代入した値を必ずnilにすること
        availableFunds = nil
        sut = nil
    }
    
    // test*という名称にする
    func testInitAvailableFunds_setsAvailableFunds() {
        XCTAssertEqual(sut.availableFunds, availableFunds)
    }
    
    func testAddItem_oneItem_addCostToTransactionTotal() {        
        let itemCost = Decimal(42)
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
}

CashRegisterTests.defaultTestSuite.run()
