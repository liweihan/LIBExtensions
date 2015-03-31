#
# Be sure to run `pod lib lint LIBExtensions.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LIBExtensions"
  s.version          = "0.2.1"
  s.summary          = "A comment set of extensions/categories that I use for my projects"

  s.homepage         = "https://github.com/liweihan/LIBExtensions"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Weihan Li" => "413019390@qq.com" }
  s.source           = { :git => "https://github.com/liweihan/LIBExtensions.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'LIBExtensions' => ['Pod/Assets/*.png']
  }
  s.dependency 'PureLayout'
  s.dependency 'SDWebImage'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
