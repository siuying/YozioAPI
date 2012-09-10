Pod::Spec.new do |s|
  s.name = 'YozioAPI'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'A simple library that perform asynchonous client side app install tracking using Yoz.io service'
  s.homepage = 'https://github.com/siuying/YozioAPI'
  s.authors = {'Francis Chong' => 'francis@ignition.hk'}
  s.source = { :git => 'git://github.com/siuying/YozioAPI.git', :tag => '0.1.0' }
  s.source_files = 'YozioAPI/Classes'
  s.dependency 'ASIHTTPRequest'
end