//
//  DetailedNewsItem.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper
import DAO

struct DetailedNewsItem {
  
  var title: NewsItem!
  var content: String!
  
}

extension DetailedNewsItem: Mappable {
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    title   <- map["title"]
    content <- map["content"]
  }
  
}
