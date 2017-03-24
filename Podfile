# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Tinkoff' do

  use_frameworks!
  pod 'RxSwift', 					        '~> 3.3'
  pod 'RxCocoa', 					        '~> 3.3'
  pod 'RxDataSources', 				    '~> 1.0'
  pod 'Moya', 						        '~> 8.0'
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper',        '~> 2.3'
  pod 'Moya-ObjectMapper/RxSwift'
  
  # Обязательно зацените мою имплементацию DAO
  pod 'RealmSwift',               '~> 2.4'
  pod 'DAO',                      :git => 'https://github.com/biboran/dao.git'

  target 'TinkoffTests' do
    inherit! :search_paths
    pod 'RxBlocking', '~> 3.3'
  end

end
