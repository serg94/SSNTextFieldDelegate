Pod::Spec.new do |s|
  s.name          = "SSNTextFieldDelegate"
  s.version       = "0.0.1"
  s.summary       = "SSNTextFieldDelegate lets you format input as SSN, and give you SSN validation."
  s.requires_arc  = true
  s.homepage      = "https://github.com/serg94/SSNTextFieldDelegate"
  s.license       = { :type => "THE BEER-WARE LICENSE", :file => "LICENSE" }
  s.author        = { "sergey.sahakyan" => "sergeysahakyan94@gmail.com" }
  s.platform      = :ios
  s.ios.deployment_target = "8.0"
  s.source        = { :git => "https://github.com/serg94/SSNTextFieldDelegate.git", :tag => s.version }
  s.source_files  = 'ssnField/**/SSN.swift', 'ssnField/**/SSNTextFieldDelegate.swift'
end
