//
//  NewsTarget.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import Moya

enum NewsTarget: TargetType {
  
  case tinkoff
  
  var baseURL: URL {
    return URL(string: "https://api.tinkoff.ru/v1")!
  }
  
  var path: String {
    return "/news"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var parameterEncoding: ParameterEncoding {
    return JSONEncoding()
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    return .request
  }
  
  var parameters: [String : Any]? {
    return nil
  }
  
}
