//
//  FeedViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/25/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import IGListKit
import ReactiveSwift

class FeedViewController: BaseViewController {

  private lazy var navigationBarView: NavigationBarView = {
    let navigationBarView = NavigationBarView()
    return navigationBarView
  }()

  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    view.addSubview(collectionView)
    return collectionView
  }()

  private lazy var loadingView: LoadingView = {
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    return loadingView
  }()

  private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)

  private let viewModel: FeedViewModelType

  init(viewModel: FeedViewModelType) {
    self.viewModel = viewModel
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
             FeedSectionModel(id: "id3", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id4", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id5", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id6", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id7", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id8", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id9", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id10", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork),
             FeedSectionModel(id: "id11", actorName: "actorName", avatarUrl: "avatarUrl", action: .fork) ]
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
    setupView()
    setupListAdapter()
    setupConstraints()
    setupBindings()
  }

  func setupView() {
    view.backgroundColor = AppColors.Feed.backgroundColor
    navigationBarView.attachToTop(of: view)
  }

  func setupListAdapter() {
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }

  func setupBindings() {
    viewModel.inputs.isVisible <~ isVisible

    loadingView.reactive.isHidden <~ viewModel.outputs.isLoading.negate()
  }
}

// MARK: - Constraints
private extension FeedViewController {
  func setupConstraints() {
    setupCollectionViewConstraints()
    setupLoadingViewConstraints()
  }

  func setupCollectionViewConstraints() {
    collectionView.apply {
      $0.topConstraint(onBottomOf: navigationBarView, constant: 1)
      $0.bottomConstraint(constant: 0)
      $0.leadingConstraint(constant: 0)
      $0.trailingConstaint(constant: 0)
    }
  }

  func setupLoadingViewConstraints() {
    loadingView.apply {
      $0.stickToParentEdges()
    }
  }
}
