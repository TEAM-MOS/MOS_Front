# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'MOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MOS
  pod 'DeviceKit', '~> 4.0'
  pod 'DropDown'
  pod 'LZViewPager'
  pod 'DatePicker', '~> 1.3.0'
  pod 'Fastis', '~> 2.0'
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'Tabman', '~> 3.0'
  pod 'Kingfisher', '~> 6.0'

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end
          end
   end
end
end