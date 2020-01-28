//
//  ListAdapter+Extensions.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import IGListKit
import ReactiveSwift

extension Reactive where Base: ListAdapter {
  public var reloadData: BindingTarget<()> {
    return makeBindingTarget { base, _ in
      base.reloadData()
    }
  }

  public var performUpdates: BindingTarget<()> {
    return makeBindingTarget { base, _ in
      base.collectionView?.collectionViewLayout.invalidateLayout()
      base.performUpdates(animated: true, completion: nil)
    }
  }

  public func performUpdates(animated: Bool, completion: ListUpdaterCompletion?) -> BindingTarget<()> {
    return makeBindingTarget { base, _ in
      base.collectionView?.collectionViewLayout.invalidateLayout()
      base.performUpdates(animated: animated, completion: completion)
    }
  }

  public func reloadData(completion: ListUpdaterCompletion?) -> BindingTarget<()> {
    return makeBindingTarget { base, _ in
      base.reloadData(completion: completion)
    }
  }
}
