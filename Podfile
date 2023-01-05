# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

def shared_pods
  use_frameworks!

  pod 'TinyConstraints', '~> 4.0'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher', :branch => 'version6-xcode13'

  #Network Packages
  pod 'netfox'
  pod 'OHHTTPStubs/Swift'
 

end

workspace 'MovieApp'

flipperkit_version = '0.172.0'

target 'MovieApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MovieApp
  pod 'Alamofire', '~> 5.4'
  shared_pods

  # Lint
  pod 'SwiftLint', '~> 0.43'

  # Helper
  pod 'IQKeyboardManagerSwift' 

  # UI
  pod 'SwiftEntryKit', '2.0.0'

  pod 'FlipperKit', '~>' + flipperkit_version
  pod 'FlipperKit/FlipperKitLayoutComponentKitSupport', '~>' + flipperkit_version
  pod 'FlipperKit/SKIOSNetworkPlugin', '~>' + flipperkit_version
  pod 'FlipperKit/FlipperKitUserDefaultsPlugin', '~>' + flipperkit_version
  pod 'Flipper-DoubleConversion', :configuration => 'Debug'
  pod 'Flipper-Folly', :configuration => 'Debug'
  pod 'Flipper-Glog', :configuration => 'Debug'
  pod 'Flipper-PeerTalk', :configuration => 'Debug'
  pod 'CocoaLibEvent', :configuration => 'Debug'
  pod 'boost-for-react-native', :configuration => 'Debug'
  pod 'OpenSSL-Universal', :configuration => 'Debug'
  pod 'CocoaAsyncSocket', :configuration => 'Debug'
  pod 'ComponentKit', '~> 0.31'


end

target 'UIComponents' do
  
  project 'UIComponents/UIComponents.xcodeproj'
  
  # Pods for UIComponents
  
  # Generater
  pod 'SwiftGen', '~> 6.5.1'
  pod 'TinyConstraints', '~> 4.0'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher', :branch => 'version6-xcode13'
  
  # Helper

  
  # UI

end

target 'DataProvider' do
  
  project 'DataProvider/DataProvider.xcodeproj'
  
  # Pods for DataProvider
  
  # Network
  pod 'Alamofire', '~> 5.4'
  
  # Helper


end 

target 'Utilities' do
  
  project 'Utilities/Utilities.xcodeproj'

  # Pods for Utilities
  
  # Helper


end

$static_framework = ['FlipperKit', 'Flipper', 'Flipper-Folly',
    'CocoaAsyncSocket', 'ComponentKit', 'Flipper-DoubleConversion',
     'Flipper-Glog', 'Flipper-PeerTalk', 'Flipper-RSocket', 'Yoga', 'YogaKit',
     'CocoaLibEvent', 'OpenSSL-Universal', 'boost-for-react-native', 'Flipper-Fmt']
  
   pre_install do |installer|
     Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) {}
     installer.pod_targets.each do |pod|
         if $static_framework.include?(pod.name)
           def pod.build_type;
             Pod::BuildType.static_library
           end
         end
       end
   end

