//
//  FeedViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import IGListKit

class FeedViewController: BaseViewController {

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .yellow
    view.addSubview(collectionView)
    return collectionView
  }()

  private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)

  override init() {
    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    setup()

  }
}

extension FeedViewController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    // this can be anything!
    return [ FeedSectionModel(id: "id1", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id2", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id3", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork) ]
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return FeedSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

private extension FeedViewController {
  func setup() {
    configureListAdapter()
    setupConstraints()
  }

  func configureListAdapter() {
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }
}

// MARK: - Constraints
private extension FeedViewController {
  func setupConstraints() {
    setupCollectionViewConstraints()
  }

  func setupCollectionViewConstraints() {
    collectionView.apply {
      $0.stickToParentEdges()
    }
  }
}
