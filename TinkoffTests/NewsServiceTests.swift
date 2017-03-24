//
//  NewsServiceTests.swift
//  Tinkoff
//
//  Created by Timofey on 3/21/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import XCTest
import RxBlocking
import DAO
import RealmSwift
import RxSwift
@testable import Tinkoff

class NewsServiceTests: XCTestCase {
  
  var service: NewsService!
  
  var dao: AnyDAO<NewsItem>!
  
  let inmemoryIdentifier = "Realm.Test"
  
  override func setUp() {
    
    let utilityQueue = DispatchQueue.global(qos: .utility)
    let utilityScheduler = ConcurrentDispatchQueueScheduler(queue: utilityQueue)
    let realm = try! Realm(configuration: .init(inMemoryIdentifier: self.inmemoryIdentifier))
    
    dao = AnyDAO(base: CascadeRealmDAO<RealmNewsItem>(operationalRealm: realm))
    service = NewsService(scheduler: utilityScheduler, dao: dao)
  }
  
  override func tearDown() {
    service = nil
    dao = nil
  }
  
  func testSuccessfulCallAndPersistance() {
    guard
      let response = try! service.getNewsFromAPI().toBlocking().first() else {
        XCTFail()
        return
    }
    
    let storedItems = dao.getAll()
    
    for item in storedItems {
      XCTAssert(response.newsList.contains(item))
    }
  }
  
  func testGetFromDAO() {
    guard
      let APIResponse = try! service.getNewsFromAPI().toBlocking().first() else {
        XCTFail()
        return
    }
    
    guard
      let cachedResponse = try! service.getNewsFromDAO().toBlocking().first() else {
        XCTFail()
        return
    }
    
    XCTAssert(APIResponse.newsList == cachedResponse.newsList)
    
  }
  
}
