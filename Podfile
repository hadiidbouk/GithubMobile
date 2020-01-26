# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'GithubMobile.xcworkspace'
use_frameworks!
platform :ios, '10.0'
inhibit_all_warnings!

def common
  pod 'ReactiveSwift', '~> 6.0'
  pod 'XCGLogger', '~> 7.0.0'
end

def platform_app_common
  pod 'Moya/ReactiveSwift', '~> 14.0.0-beta.1'
end

target 'GithubMobile' do

  # Pods for GithubMobile
  common
  platform_app_common
  pod 'ReactiveCocoa', '~> 10.2.0'
  pod 'OAuthSwift', '~> 2.0.0'
  pod 'IGListKit', '~> 4.0.0'

  target 'Platform' do
    project 'Platform/Platform'
    common
    platform_app_common
  end

  target 'Domain' do
    project 'Domain/Domain'
    common
  end
end
