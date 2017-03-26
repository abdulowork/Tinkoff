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
  case detailedItem(for: NewsItem)
  
  var baseURL: URL {
    return URL(string: "https://api.tinkoff.ru/v1")!
  }
  
  var path: String {
    switch self {
    case .tinkoff: return "/news"
    case .detailedItem(for: _): return "/news_content"
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var parameterEncoding: ParameterEncoding {
    return URLEncoding()
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    return .request
  }
  
  var parameters: [String : Any]? {
    switch self {
    case .detailedItem(for: let item):
      return ["id" : "\(item.id!)"]
    default:
      return nil
    }
  }
  
}
