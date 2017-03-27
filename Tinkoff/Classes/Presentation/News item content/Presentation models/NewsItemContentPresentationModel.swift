//
//  NewsItemContentPresentationModel.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift

class NewsItemContentPresentationModel {
  
  private let disposeBag = DisposeBag()
  
  private let newsService: NewsService
  private let workScheduler: SchedulerType
  
  init(newsService: NewsService, workScheduler: SchedulerType) {
    self.newsService = newsService
    self.workScheduler = workScheduler
  }
  
  var selectedNewsItem: NewsItem!
  
  let newsItemContentSubject = PublishSubject<DetailedNewsItemViewModel>()
  let errorFunnel = PublishSubject<Swift.Error>()
  
  func updateEventForSectionModelSubject(event: Observable<Void>) {
    event
      .flatMap { [unowned self] in
        self.newsService
          .getDetailedNewsItem(for: self.selectedNewsItem)
      }
      .map{ DetailedNewsItemViewModel($0.detailedNewsItem) }
      .do(
        onError: { [unowned self] error in
          self.errorFunnel.on(.next(error))
      })
      .bindTo(newsItemContentSubject)
      .disposed(by: disposeBag)
  }
  
}
