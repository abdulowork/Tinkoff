//
//  NewsItemViewModel.swift
//  Tinkoff
//
//  Created by Timofey on 3/24/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation

struct NewsItemViewModel {
  
  let text: String
  
  let model: NewsItem
  
  init(_ model: NewsItem) {
    self.model = model
    self.text = model.text
  }
  
}
