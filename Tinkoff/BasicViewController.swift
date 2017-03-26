//
//  BasicViewController.swift
//  Tinkoff
//
//  Created by Timofey on 3/26/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import UIKit
import RxSwift

class BasicViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  
  func display(error: Swift.Error) {
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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if
      let origin = segue.source as? RouterType,
      let destination = segue.destination as? RouterType {
      origin.router.pass(sender, to: destination.router)
    }
  }
  
}
