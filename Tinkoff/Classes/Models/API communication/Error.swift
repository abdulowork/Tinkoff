//
//  Error.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper

struct Error {
  var resultCode: String!
  var errorMessage: String!
  var plainMessage: String!
  var trackingID: Int!
}

extension Error: Mappable {
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    resultCode    <- map["resultCode"]
    errorMessage  <- map["errorMessage"]
    plainMessage  <- map["plainMessage"]
    trackingID    <- (map["trackingId"], IntFromStringTransform())
  }
  
}

extension Error: Swift.Error, LocalizedError {
  
  var errorDescription: String? {
    return errorMessage
  }
  
}
