#
# Be sure to run `pod lib lint IMKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IMKit'
  s.version          = '0.128.0'
  s.summary          = 'IMKit Framework'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A light-weight chat solution for mobile apps and websites.'

  s.homepage         = 'https://github.com/imkit/imkit-ios-framework-v3'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = 'MIT'
  s.author           = { 'Howard Sun' => 'howard@funtek.co' }
  s.source           = { :git => 'https://github.com/imkit/imkit-ios-framework-v3.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  # s.source_files = 'IMKit/Classes/**/*'
  # s.resources = 'IMKit/Assets/Assets.xcassets'
  s.vendored_frameworks = 'IMKit.framework'
  s.ios.vendored_frameworks = 'IMKit.framework'
  # s.resources     = 'IMKit.framework/*.xib', 'IMKit.framework/*.nib', 'IMKit.framework/Assets.car', 'Assets.xcassets'
  # s.ios.resource_bundle = { 'IMKit' =>  ['IMKit.framework/*.xib', 'IMKit.framework/*.nib', 'IMKit.framework/Assets.car', 'Assets.xcassets'] }
  s.requires_arc  = true

  # s.resource_bundles = {
  #   'IMKit' => ['IMKit/Assets/Assets.xcassets']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

  s.dependency 'IGListKit', '~> 3.4.0'
  s.dependency 'PromiseKit', '~> 6.8.3'
  s.dependency 'Socket.IO-Client-Swift', '~> 14.0.0'
  s.dependency 'Kingfisher', '~> 5.3.0'
  s.dependency 'Alamofire', '~> 4.8.1'
  s.dependency 'RealmSwift', '~> 3.13.1'
  s.dependency 'SwiftLinkPreview', '~> 3.0.0'
  s.dependency 'ActiveLabel', '~> 1.0.1'
  s.dependency 'SnapKit', '~> 4.2.0'
  s.dependency 'Hero', '~> 1.4.0'
  s.dependency 'SwiftyJSON', '~> 4.2.0'
  s.dependency 'CryptoSwift', '~> 0.15.0'
  s.dependency 'Moya', '~> 12.0.1'
end
