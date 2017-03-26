//
//  Tables and Collections + Extensions.swift
//  Tinkoff
//
//  Created by Timofey on 3/25/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import UIKit

extension UITableView {
  
  func dequeueReusableCellOfType<CellType: UITableViewCell>(_ type: CellType.Type, for indexPath: IndexPath) -> CellType {
    let cellName = String(describing: type)
    register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    return dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! CellType
  }
  
}

extension UICollectionView {
  
  func dequeueReusableCellOfType<CellType: UICollectionViewCell>(_ type: CellType.Type, for indexPath: IndexPath) -> CellType {
    let cellName = String(describing: type)
    register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
    return dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! CellType
  }
  
}
