//
//  NewsItem.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import ObjectMapper
import DAO

struct NewsItem {
  
  var id: Int!
  var name: String!
  var text: String!
  var publicationDate: Date!
  var bankInfoTypeID: Int!

}

extension NewsItem: Mappable {
  
  init?(map: Map) { }
  
  mutating func mapping(map: Map) {
    id              <- (map["id"], IntFromStringTransform())
    name            <- map["name"]
    text            <- map["text"]
    publicationDate <- (map["publicationDate.milliseconds"], DateFromMillisecondsTransform())
    bankInfoTypeID  <- map["bankInfoTypeId"]
  }
  
}

extension NewsItem: Persistable, Equatable {
  
  typealias PrimaryKeyType = Int
  
  static func ==(lhs: NewsItem, rhs: NewsItem) -> Bool {
    return lhs.id == rhs.id
  }
  
}
