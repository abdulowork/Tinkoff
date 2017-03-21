//
//  BasicService.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import Moya

class BasicService<Target: TargetType> {
  
  let provider = RxMoyaProvider<Target>()
  
  typealias Seconds = TimeInterval
  
  let defaultTimeout = Seconds(20)
  
}
