//
//  DetailedNewsItemViewModel.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation

struct DetailedNewsItemViewModel {
  
  let content: String
  
  let model: DetailedNewsItem
  
  init(_ model: DetailedNewsItem) {
    self.model = model
    self.content = model.content
  }
  
}
