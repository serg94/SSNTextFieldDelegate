Pod::Spec.new do |s|

  s.name         = "ssnField"
  s.version      = "0.0.1"
  s.summary      = "SSNTextFieldDelegate lets you format input as SSN, and give you SSN validation."
  s.requires_arc = true

  s.description  = <<-DESC
                            ios SSN field ssnField ssndelegate
                   DESC

  s.homepage     = "https://github.com/serg94/SSNTextFieldDelegate"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = { :type => "THE BEER-WARE LICENSE", :file => "LICENSE" }

  s.author             = { "sergey.sahakyan" => "sergeysahakyan94@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/serg94/SSNTextFieldDelegate.git", :tag => "0.0.1" }

  s.source_files  = "ssnField/ssn/*.{swift}"

  s.framework = "UIKit"

end
