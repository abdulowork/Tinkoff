//
//  DateFromMillisecondsTransform.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper

struct DateFromMillisecondsTransform: TransformType {
  
  typealias JSON = Int
  typealias Object = Date
  
  func transformFromJSON(_ value: Any?) -> Date? {
    guard let milliseconds = value as? Int else { return nil }
    let seconds = Double(milliseconds)/1000
    return Date(timeIntervalSince1970: TimeInterval(seconds))
  }
  
  func transformToJSON(_ value: Date?) -> Int? {
    return 1
  }
  
}
