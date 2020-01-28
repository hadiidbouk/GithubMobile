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
import ReactiveCocoa

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

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    collectionView.addSubview(refreshControl)
    return refreshControl
  }()

  private lazy var loadingView: LoadingView = {
    let loadingView = LoadingView()
    view.addSubview(loadingView)
    return loadingView
  }()

  private let spinToken = "spinner"
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
    var sections = viewModel.outputs.sections.value as [ListDiffable]
    if viewModel.outputs.isLoadingOldSections.value {
      sections.append(spinToken as ListDiffable)
    }
    return sections
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    if let obj = object as? String, obj == spinToken {
      return SpinnerSectionController()
    }
    return FeedSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

extension FeedViewController: UIScrollViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                 withVelocity velocity: CGPoint,
                                 targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
    if !viewModel.outputs.isLoadingOldSections.value && distance < 200 {
      let page = viewModel.outputs.page.value + 1
      viewModel.inputs.loadOldSections.apply(page).start()
      adapter.performUpdates(animated: true, completion: nil)
    }
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
    view.backgroundColor = AppColors.global.backgroundColor
    navigationBarView.attachToTop(of: view)
  }

  func setupListAdapter() {
    adapter.collectionView = collectionView
    adapter.dataSource = self
    adapter.scrollViewDelegate = self
  }

  func setupBindings() {
    viewModel.inputs.isVisible <~ isVisible
    refreshControl.reactive.refresh = CocoaAction(viewModel.inputs.refresh)
    navigationBarView.searchButton.reactive.pressed = CocoaAction(viewModel.inputs.search)

    loadingView.reactive.isHidden <~ viewModel.outputs.isLoading.negate()
    refreshControl.reactive.isRefreshing <~ viewModel.outputs.isRefreshing
    adapter.reactive.performUpdates <~ viewModel.outputs.sections.map(value: ())
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
