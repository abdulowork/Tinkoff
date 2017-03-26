//
//  DetailedNewsResponse.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper

//TODO: Make response responsible for determining failure of request
struct DetailedNewsResponse {
  
  var detailedNewsItem: DetailedNewsItem!
  
}

extension DetailedNewsResponse: Mappable {
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    detailedNewsItem <- map["payload"]
  }
  
}
