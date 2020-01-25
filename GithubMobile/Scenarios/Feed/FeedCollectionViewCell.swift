//
//  FeedCell.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)

    contentView.backgroundColor = .red
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
