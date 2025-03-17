
Pod::Spec.new do |s|
  s.name             = 'CJSwiftUtilities'
  s.version          = '0.0.2'
  s.summary          = 'A short description of CJSwiftUtilities.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/caoguangming/CJSwiftUIExtension'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gary' => 'caoguangmingcn@gmail.com' }
  s.source           = { :git => 'https://github.com/caoguangming/CJSwiftUtilities.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '13.0'

  s.source_files = 'CJSwiftUtilities/Sources/CJSwiftUtilities/**/*'
 
end
