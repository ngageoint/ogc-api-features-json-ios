Pod::Spec.new do |s|
  s.name             = 'ogc-api-features-json-ios'
  s.version          = '4.2.1'
  s.license          =  {:type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'iOS SDK for OGC API Features JSON'
  s.homepage         = 'https://github.com/ngageoint/ogc-api-features-json-ios'
  s.authors          = { 'NGA' => '', 'BIT Systems' => '', 'Brian Osborn' => 'bosborn@caci.com' }
  s.social_media_url = 'https://twitter.com/NGA_GEOINT'
  s.source           = { :git => 'https://github.com/ngageoint/ogc-api-features-json-ios.git', :tag => s.version }
  s.requires_arc     = true

  s.platform         = :ios, '12.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'ogc-api-features-json-ios/**/*.{h,m}'

  s.frameworks = 'Foundation'

  s.dependency 'sf-geojson-ios', '~> 4.2.1'
end
