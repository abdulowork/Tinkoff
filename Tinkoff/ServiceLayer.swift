//
//  ServiceLayer.swift
//  Tinkoff
//
//  Created by Timofey on 3/23/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift
import DAO

class ServiceLayer {
  
  private init() { }
  
  let shared = ServiceLayer()
  
  //TODO: Implement threadScheduler?
  private let utilityScheduler = ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global(qos: .utility))
  private let mainQueueRealm = try! Realm()
  
  var newsService: NewsService {
    let dao = CascadeRealmDAO<RealmNewsItem>(operationalRealm: mainQueueRealm)
    return NewsService(scheduler: utilityScheduler, dao: AnyDAO(base: dao))
  }
  
}
