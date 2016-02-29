Pod::Spec.new do |s|
  s.name = 'YSSearchBar'
  s.version = '0.0.2'
  s.summary = 'Can add the left and the right buttons to a UISearchBar.'
  s.homepage = 'https://github.com/yusuga/YSSearchBar'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/YSSearchBar.git', :tag => s.version.to_s }
  s.platform = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'Classes/YSSearchBar/**/*.{h,m}'
  s.requires_arc = true
  s.compiler_flags = '-fmodules'
end