#
# Be sure to run `pod lib lint ZSWeexPluginLoader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZSWeexPluginLoader'
  s.version          = '0.0.1566020670'
  s.summary          = 'Weex Plugin Loader.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
        TODO: 可替换GitHub的WeexPluginLoader ：
              只需要将ZSWeexPluginLoader.podspec改为name改为WeexPluginLoader.podspec，s.name改为WeexPluginLoader；
              在Podfile文件中使用pod 'WeexPluginLoader', :source => 'http://git.xxxx/Specs' 方式指向自己的私有源，替换GitHub上的
                       DESC

  s.homepage         = 'https://github.com/Zss1990/ZSWeexPluginLoader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shuaishuai' => '957715883@qq.com' }
  s.source           = { :git => 'https://github.com/Zss1990/ZSWeexPluginLoader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.requires_arc = true

  s.public_header_files  = 'ZSWeexPluginLoader/Classes/**/*.h'
  s.source_files = 'ZSWeexPluginLoader/Classes/**/*.{h,m,mm}'
  # s.ios.resource = [
  #   'ZSWeexPluginLoader/Assets/**/*.{png,xib,storyboard,bundle,xcassets}',
  #   'ZSWeexPluginLoader/Classes/**/*.{png,xib,storyboard}'
  # ]
  
  s.libraries = "stdc++"

  s.dependency "WeexSDK"
  s.dependency 'SocketRocket'
  
end
