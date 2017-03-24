//
//  RealmNewsItem.swift
//  Tinkoff
//
//  Created by Timofey on 3/23/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RealmSwift
import DAO

final class RealmNewsItem: Object, EntryType {
  
  dynamic var id: Int                 = 0
  dynamic var name: String            = ""
  dynamic var text: String            = ""
  dynamic var publicationDate: Double = 0
  dynamic var bankInfoTypeID: Int     = 0
  
  typealias EntityType = NewsItem
  
  override func isEqual(_ object: Any?) -> Bool {
    if let object = object as? RealmNewsItem {
      return id == object.id
    }
    return super.isEqual(object)
  }
  
  func toEntity() -> NewsItem {
    return
      NewsItem(id: id,
               name: name,
               text: text,
               publicationDate: Date(timeIntervalSince1970: TimeInterval(publicationDate)),
               bankInfoTypeID: bankInfoTypeID)
  }
  
  static func entry(from: NewsItem) -> RealmNewsItem {
    let entry = RealmNewsItem()
    entry.id = from.id
    entry.name = from.name
    entry.text = from.text
    entry.publicationDate = from.publicationDate.timeIntervalSince1970
    entry.bankInfoTypeID = from.bankInfoTypeID
    return entry
  }
  
  override class func primaryKey() -> String? {
    return "id"
  }
  
}
