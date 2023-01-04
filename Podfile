# Uncomment the next line to define a global platform for your project
# platform :ios, '11.0'

def shared_pods
  use_frameworks!

  pod 'TinyConstraints', '~> 4.0'
  pod 'Kingfisher', :git => 'https://github.com/onevcat/Kingfisher', :branch => 'version6-xcode13'

end

workspace 'MovieApp'

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
