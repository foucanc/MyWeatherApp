platform :ios, '10.0'
use_frameworks!

target 'MyWeatherApp' do
	pod 'Alamofire', '~> 4.0'
	pod 'RxAlamofire'
	pod 'RxSwift', '~> 3.0'
    	pod 'RxCocoa', '~> 3.0'
	pod 'Bond'
	pod 'SwiftyJSON'
	pod 'RealmSwift'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0.1'
    end
  end
end
