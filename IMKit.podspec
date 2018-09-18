#
# Be sure to run `pod lib lint IMKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IMKit'
  s.version          = '0.1.0'
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
  s.resources     = 'IMKit.framework/*.xib', 'IMKit.framework/*.nib', 'IMKit.framework/Assets.car'
  s.ios.resource_bundle = { 'IMKit' =>  ['IMKit.framework/*.xib', 'IMKit.framework/*.nib', 'IMKit.framework/Assets.car'] }
  s.requires_arc  = true

  # s.resource_bundles = {
  #   'IMKit' => ['IMKit/Assets/Assets.xcassets']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

  s.dependency 'IGListKit'
  s.dependency 'PromiseKit'
  s.dependency 'Socket.IO-Client-Swift'
  s.dependency 'Kingfisher'
  s.dependency 'Alamofire'
  s.dependency 'RealmSwift'
  s.dependency 'SwiftLinkPreview'
  s.dependency 'ActiveLabel'
  s.dependency 'SnapKit'
  s.dependency 'Hero'
  s.dependency 'SwiftyJSON'
  s.dependency 'CryptoSwift'
end
