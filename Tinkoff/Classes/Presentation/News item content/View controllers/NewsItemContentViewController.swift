//
//  NewsItemContentViewController.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NewsItemContentViewController: BasicViewController, RouterType {
  
  //TODO: Global routing without storyboard segues
  let presentationModel = NewsItemContentPresentationModel(newsService: ServiceLayer.shared.newsService, workScheduler: ConcurrentDispatchQueueScheduler(qos: .utility))
  
  @IBOutlet weak var contentLabel: UILabel!
  
  var router: AnyRouter! {
    return NewsItemContentRouter(viewController: self)
  }
  
  override func viewDidLoad() {
    presentationModel
      .newsItemContentSubject
      .map{ $0.content }
      .bindTo(contentLabel.rx.text)
      .disposed(by: disposeBag)
    
    configureErrorHandling()
    
    presentationModel.updateEventForSectionModelSubject(event: Observable.just())
  }
  
  //TODO: Generic presentationModel?
  private func configureErrorHandling() {
    presentationModel
      .errorFunnel
      .subscribe(onNext: { [unowned self] error in
        self.display(error: error)
      })
      .disposed(by: disposeBag)
  }
  
}
