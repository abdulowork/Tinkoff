//
//  ResponseMappingTests.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import XCTest
@testable import Tinkoff
import ObjectMapper
import Alamofire

class ResponseMappingTests: XCTestCase {
  
  var jsonString: String!
  
  func testResponseWrapperMappingForNewsResponse() {
    guard
      let jsonURL = Bundle(for: ResponseMappingTests.self).url(forResource: "news", withExtension: "json"),
      let jsonString = try? String.init(contentsOf: jsonURL, encoding: .utf8) else {
        XCTFail()
        return
    }
    
    guard let wrapper = Mapper<MoyaResponseWrapper<NewsResponse>>().map(JSONString: jsonString) else {
      XCTFail()
      return
    }
    
    switch wrapper {
    case let .response(response):
      XCTAssert(response.newsList[0].id > 0) //FIXME
    default:
      XCTFail()
    }
    
  }
  
  func testErrorWrapperMapping() {
    guard
      let jsonURL = Bundle(for: ResponseMappingTests.self).url(forResource: "error", withExtension: "json"),
      let jsonString = try? String.init(contentsOf: jsonURL, encoding: .utf8) else {
        XCTFail()
        return
    }
    
    guard let wrapper = Mapper<MoyaResponseWrapper<NewsResponse>>().map(JSONString: jsonString) else {
      XCTFail()
      return
    }
    
    switch wrapper {
    case let .error(error):
      let trackingIDFromJSON = 28969540330
      XCTAssert(error.trackingID == trackingIDFromJSON) //FIXME
    default:
      XCTFail()
    }
    
  }
  
}
