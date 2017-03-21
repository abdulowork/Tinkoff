//
//  NewsServiceTests.swift
//  Tinkoff
//
//  Created by Timofey on 3/21/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import XCTest
import RxBlocking
@testable import Tinkoff

class NewsServiceTests: XCTestCase {
  
  var service: NewsService!
  
  override func setUp() {
    service = NewsService()
  }
  
  override func tearDown() {
    service = nil
  }
  
  func testExample() {
    guard
      let response = try! service.getNewsFromAPI().toBlocking().first() else {
        XCTFail()
        return
    }
    
    XCTAssert(response.newsList[0].id > 0) //FIXME
    
  }
  
}
