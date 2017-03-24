//
//  AppConstants.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

let utilityQueue =
  DispatchQueue(
    label: "utilityQueue",
    qos: .utility,
    attributes: .concurrent,
    autoreleaseFrequency: .inherit,
    target: nil)

let utilityScheduler = ConcurrentDispatchQueueScheduler(queue: utilityQueue)
let utilityRealm = try! utilityQueue.sync(execute: { try Realm() })
