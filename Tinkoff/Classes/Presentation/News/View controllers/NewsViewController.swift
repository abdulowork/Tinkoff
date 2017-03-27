//
//  NewsViewController.swift
//  Tinkoff
//
//  Created by Timofey on 3/20/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift

final class NewsViewController: BasicViewController, RouterType {
  
  @IBOutlet weak var tableView: UITableView!
  
  let presentationModel = NewsPresentationModel(newsService: ServiceLayer.shared.newsService, workScheduler: ConcurrentDispatchQueueScheduler(qos: .utility))
  
  var router: AnyRouter! = AnyRouter()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureTableView()
    configureErrorHandling()
    configureSegue()
  }
  
  private func configureTableView() {
    let control = UIRefreshControl()
    tableView.refreshControl = control
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
    
    let dataSource = self.dataSource()
    presentationModel
      .sectionModelsSubject
      .bindTo(tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
    
    presentationModel
      .sectionModelUpdatingIsInProgress
      .bindTo(control.rx.isRefreshing)
      .disposed(by: disposeBag)
    
    presentationModel
      .updateEventForSectionModelSubject(event:
        control.rx.controlEvent(UIControlEvents.valueChanged)
          .asObservable().debug()
    )
  }
  
  private func configureErrorHandling() {
    presentationModel
      .errorFunnel
      .subscribe(onNext: { [unowned self] error in
        self.display(error: error)
      })
      .disposed(by: disposeBag)
  }
  
  private func configureSegue() {
    tableView.rx
      .modelSelected(NewsItemViewModel.self)
      .subscribe(onNext: { [unowned self] viewModel in
        self.performSegue(withIdentifier: "NewsItemContent", sender: viewModel.model)
      })
      .disposed(by: disposeBag)
  }
  
  private func dataSource() -> RxTableViewSectionedReloadDataSource<NewsPresentationModel.SectionModel> {
    let dataSource = RxTableViewSectionedReloadDataSource<NewsPresentationModel.SectionModel>()
    dataSource.configureCell = { _, tableView, indexPath, viewModel in
      let cell = tableView.dequeueReusableCellOfType(NewsCell.self, for: indexPath)
      cell.contentLabel.text = viewModel.text
      return cell
    }
    return dataSource
  }
  
}



