//
//  NewsPresentationModel.swift
//  Tinkoff
//
//  Created by Timofey on 3/24/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import UIKit

class NewsPresentationModel {
  
  private let disposeBag = DisposeBag()
  
  private let newsService: NewsService
  private let workScheduler: SchedulerType
  
  //TODO: WorkSchedulerUser injection
  init(newsService: NewsService, workScheduler: SchedulerType) {
    self.newsService = newsService
    self.workScheduler = workScheduler
  }
  
  let sectionModelsSubject = PublishSubject<[SectionModel]>()
  let errorFunnel = PublishSubject<Swift.Error>()
  let sectionModelUpdatingIsInProgress = PublishSubject<Bool>()
  
  func updateEventForSectionModelSubject(event: Observable<Void>) {
    event
      .do(onNext: { [unowned self] in self.sectionModelUpdatingIsInProgress.on(.next(true)) } )
      .flatMap { [unowned self] in
        self.newsService
          .getNewsFromAPI()
      }
      .observeOn(workScheduler)
      .map{ $0.newsList.map{ NewsItemViewModel($0) } }
      .map{ [SectionModel(items: $0)] }
      .observeOn(MainScheduler.instance)
      .do(
        onNext: { [unowned self] _ in
          self.sectionModelUpdatingIsInProgress.on(.next(false))
        },
        onError: { [unowned self] error in
          self.sectionModelUpdatingIsInProgress.on(.next(false))
          self.errorFunnel.on(.next(error))
      })
      .retry()
      .bindTo(sectionModelsSubject)
      .disposed(by: disposeBag)
  }
  
  struct SectionModel: SectionModelType {
    var items: [NewsItemViewModel]
    public typealias Item = NewsItemViewModel
    
    init(items: [SectionModel.Item]) {
      self.items = items
    }
    
    init(original: SectionModel, items: [SectionModel.Item]) {
      self = original
      self.items = items
    }
  }
  
}
