//
//  ObservableType+Response mapping.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper
import Moya_ObjectMapper

extension ObservableType where E: Moya.Response {
  
  //Обработка ошибок и сериализация
  func mapResponse<T: Mappable>(_ type: T.Type) -> Observable<T> {
    return flatMap { moyaResponse -> Observable<T> in
      let wrapper = try moyaResponse.mapObject(MoyaResponseWrapper<T>.self)
      switch wrapper {
      case let .error(error):
        throw error
      case let .response(response):
        return Observable.just(response)
      }
    }
  }
  
}
