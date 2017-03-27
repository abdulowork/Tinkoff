//
//  IntFromStringTransform.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper

struct IntFromStringTransform: TransformType {
  
  typealias JSON = String
  typealias Object = Int
  
  func transformFromJSON(_ value: Any?) -> Int? {
    guard let value = value as? String else { return nil }
    return Int(value)
  }
  
  func transformToJSON(_ value: Int?) -> String? {
    guard let value = value else { return nil }
    return String(value)
  }
  
}
