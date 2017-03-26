//
//  NewsItemContentRouter.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation

class NewsItemContentRouter: BasicRouter<NewsItemContentViewController> {
  
  override func handle(_ data: Any?) {
    guard let newsItem = data as? NewsItem else { fatalError() }
    viewController.presentationModel.selectedNewsItem = newsItem
  }
  
}
