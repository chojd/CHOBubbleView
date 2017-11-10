#
# Be sure to run `pod lib lint CHOBubbleView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CHOBubbleView'
  s.version          = '0.1.0'
  s.summary          = 'CHOBubbleView.'

  s.description      = <<-DESC
            CHOBubbleView.
                       DESC

  s.homepage         = 'https://github.com/chojd/CHOBubbleView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gene' => 'jingda.cao@gmail.com' }
  s.source           = { :git => 'https://github.com/chojd/CHOBubbleView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/JingdaCao'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/*'

end
