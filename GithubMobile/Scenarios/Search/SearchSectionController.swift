//
//  SearchSectionController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import IGListKit

class SearchSectionController: ListGenericSectionController<SearchSectionModel> {
  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 120)
  }

  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let context = collectionContext else {
      preconditionFailure("Context is not configured")
    }

    guard let cell = context.dequeueReusableCell(of: SearchCollectionViewCell.self, for: self, at: index) as? SearchCollectionViewCell else {
      preconditionFailure("Registered cell is of unexpected type")
    }

    guard let model = object else {
      preconditionFailure("Model is not configured")
    }

    cell.update(with: model)

    return cell
  }
}
