//
//  MoyaResponseWrapper.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper

enum MoyaResponseWrapper<Response: Mappable>: Mappable {
  case error(Error)
  case response(Response)
  
  init?(map: Map) {
    let tinkoffSuccessfulResponseKey = "OK"
    switch map["resultCode"].currentValue as? String == tinkoffSuccessfulResponseKey {
    case true:
      self = MoyaResponseWrapper<Response>.response(Response(map: map)!)
    case false:
      self = MoyaResponseWrapper<Response>.error(Error(map: map)!)
    }
  }
  
  mutating func mapping(map: Map) {
    let map = Map(mappingType: .fromJSON, JSON: ["data" : map.JSON])
    switch self {
    case var .response(response):
      response <- map["data"]
      self = .response(response)
    case var .error(error):
      error    <- map["data"]
      self = .error(error)
    }
  }
  
}
