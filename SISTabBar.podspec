#
# Be sure to run `pod lib lint iOSAppSharedModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'SISTabBar'
    s.version          = '0.0.2'
    s.summary          = 'SISTabBar.'

    s.description      = <<-DESC
                        this is SISTabBar
                       DESC

    s.homepage         = 'https://github.com/destinyzhao/SISTabBar'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Destiny' => '346276712@qq.com' }
    s.source           = { :git => 'https://github.com/destinyzhao/SISTabBar.git', :tag => s.version.to_s }
    s.ios.deployment_target = '8.0'
    s.source_files = 'SISTabBar/**/*.{h,m}'

end
