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

final class NewsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let disposeBag = DisposeBag()
  
  let presentationModel = NewsPresentationModel(newsService: ServiceLayer.shared.newsService, workScheduler: ConcurrentDispatchQueueScheduler(qos: .utility))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
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
  
  private func display(error: Swift.Error) {
    let alertController
      = UIAlertController(title: "Error",
                        message: error.localizedDescription,
                        preferredStyle: .alert)
    
    let dismissAction
      = UIAlertAction(title: "Dismiss",
                      style: .cancel,
                      handler: { [unowned alertController] _ in alertController.dismiss(animated: true, completion: nil)})
    
    alertController.addAction(dismissAction)
    
    present(alertController, animated: true, completion: nil)
  }
  
}



