require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNAdyenCrypt"
  s.version      = "1.0.1"
  s.summary      = "RNAdyenCrypt"
  s.description  = <<-DESC
                  RNAdyenCrypt
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "rph7@live.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNAdyenCrypt.git", :tag => "master" }
  # s.source_files  = "RNAdyenCrypt/**/*.{h,m}"
  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "Adyen"
  #s.dependency "others"

end

  