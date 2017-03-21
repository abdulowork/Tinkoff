//
//  NewsService.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift

class NewsService: BasicService<NewsTarget> {
  
  func getNewsFromAPI() -> Observable<NewsResponse> {
    return
      provider
        .request(.tinkoff)
        .timeout(defaultTimeout, scheduler: utilityScheduler)
        .mapResponse(NewsResponse.self)
    
  }
  
}
