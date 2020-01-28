//
//  Kingfisher+Extensions.swift
//  GithubMobile
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import ReactiveSwift
import ReactiveCocoa
import Kingfisher

extension Reactive where Base == UIImageView {
    var image: BindingTarget<String> {
      return makeBindingTarget { base, urlString in
        let url = URL(string: urlString)
        base.kf.setImage(with: url)
      }
    }

  var imageWithPlaceholder: BindingTarget<(String, UIImage)> {
    return makeBindingTarget { base, tuple in
      let (urlString, image) = tuple
      let url = URL(string: urlString)
      base.kf.setImage(with: url,
                       placeholder: image,
                       options: [
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                       ])
    }
  }
}
