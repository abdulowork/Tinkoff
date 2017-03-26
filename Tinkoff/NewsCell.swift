//
//  NewsCell.swift
//  Tinkoff
//
//  Created by Timofey on 3/25/17.
//  Copyright © 2017 Timofey. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
  
  @IBOutlet weak var contentLabel: UILabel!
  
  override func prepareForReuse() {
    contentLabel.text = nil
  }
  
}
