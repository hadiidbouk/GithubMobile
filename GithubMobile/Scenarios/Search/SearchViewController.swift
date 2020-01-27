//
//  SearchViewController.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/27/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import IGListKit

class SearchViewController: BaseViewController {

  private lazy var navigationBarView: NavigationBarView = {
    let navigationBarView = NavigationBarView()
    return navigationBarView
  }()

  private lazy var searchTextField: UISearchTextField = {
    let searchTextField = UISearchTextField()
    view.addSubview(searchTextField)
    return searchTextField
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

  private lazy var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
  private let viewModel: SearchViewModelType

  init(viewModel: SearchViewModelType) {
    self.viewModel = viewModel
    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
  }
}

extension SearchViewController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    let sections = viewModel.outputs.sections.value as [ListDiffable]
    return sections
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return SearchSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

private extension SearchViewController {
  func setup() {
    setupView()
    setupListAdapter()
    setupConstraints()
    setupBindings()
  }

  func setupView() {
    navigationBarView.attachToTop(of: view)
    navigationBarView.isBackButtonVisible.value = true
    navigationBarView.isSearchButtonVisible.value = false
    view.backgroundColor = AppColors.Shared.backgroundColor
  }

  func setupListAdapter() {
    adapter.collectionView = collectionView
    adapter.dataSource = self
  }

  func setupBindings() {
    navigationBarView.backButton.reactive.pressed = CocoaAction(viewModel.inputs.dismiss)
  }
}

// MARK: - Constraints
private extension SearchViewController {
  func setupConstraints() {
    setupSearchTextFieldConstraints()
    setupCollectionViewConstraints()
  }

  func setupSearchTextFieldConstraints() {
    searchTextField.apply {
      $0.topConstraint(onBottomOf: navigationBarView, constant: 20)
      $0.leadingConstraint(constant: 20)
      $0.trailingConstaint(constant: -20)
      $0.heightConstraint(constant: 30)
    }
  }

  func setupCollectionViewConstraints() {
    collectionView.apply {
      $0.topConstraint(onBottomOf: searchTextField, constant: 10)
      $0.leadingConstraint(constant: 0)
      $0.trailingConstaint(constant: 0)
      $0.bottomConstraint(constant: 0)
    }
  }
}
