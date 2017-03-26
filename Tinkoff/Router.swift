//
//  Router.swift
//  Tinkoff
//
//  Created by Timofey on 3/27/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import UIKit

protocol RouterType {
  var router: AnyRouter! { get set }
}

class AnyRouter {
  
  func pass(_ data: Any?, to router: AnyRouter) {
    router.handle(data)
  }
  
  func handle(_ data: Any?) {
    fatalError()
  }
  
}

class BasicRouter<ViewController: UIViewController>: AnyRouter {
  
  let viewController: ViewController
  
  init(viewController: ViewController) {
    self.viewController = viewController
  }
  
  final override func pass(_ data: Any?, to router: AnyRouter) {
    super.pass(data, to: router)
  }
  
  override func handle(_ data: Any?) {
    super.handle(data)
  }
  
}
