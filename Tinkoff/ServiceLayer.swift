//
//  ServiceLayer.swift
//  Tinkoff
//
//  Created by Timofey on 3/23/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import DAO

class ServiceLayer {
  
  private init() { }
  
  let shared = ServiceLayer()
  
  var newsService: NewsService {
    let dao = CascadeRealmDAO<RealmNewsItem>(operationalRealm: utilityRealm)
    return NewsService(scheduler: utilityScheduler, dao: AnyDAO(base: dao))
  }
  
}
