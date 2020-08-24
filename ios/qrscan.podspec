#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'qrscan'
  s.version          = '1.0.0'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = ''
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => '' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.swift_version = '4.2'
  s.ios.deployment_target = '9.0'
  
  s.resource_bundles = {
      'qrscanLocalizeBundle' => ['LocalizedStrings/*.lproj']
  }
end

