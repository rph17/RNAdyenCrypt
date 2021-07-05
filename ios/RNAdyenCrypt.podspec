Pod::Spec.new do |s|
  s.name         = "RNAdyenCrypt"
  s.version      = "1.0.4"
  s.summary      = "RNAdyenCrypt"
  s.description  = <<-DESC
                    RNAdyenCrypt
                   DESC
  s.homepage     = "https://github.com/rph17/RNAdyenCrypt"
  s.license      = "MIT"
  s.author             = { "author" => "rph7@live.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/rph17/RNAdyenCrypt.git", :tag => "master" }
  s.source_files  = "*.{h,m,mm,swift}"
  s.requires_arc = true

  s.dependency 'React'
  s.dependency "Adyen"
end
