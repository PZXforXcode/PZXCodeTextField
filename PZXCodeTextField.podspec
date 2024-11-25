#
#  Be sure to run `pod spec lint PZXCodeTextField.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "PZXCodeTextField"
  spec.version      = "0.0.7"
  spec.summary      = "A Swift library for customizable code text fields."
  spec.description  = <<-DESC
                       PZXCodeTextField is a Swift library that provides a customizable code text field, useful for verification codes and other scenarios requiring user input.
                       DESC
  spec.homepage     = "https://github.com/PZXforXcode/PZXCodeTextField"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "KpengS" => "pengzuxinXcode@outlook.com" }
  spec.source       = { :git => "https://github.com/PZXforXcode/PZXCodeTextField.git", :tag => "#{spec.version}" }
  spec.source_files  = "PZXVerificationCodeTextField/Sources/**/*.{h,m,swift}"
  spec.platform = :ios
  spec.ios.deployment_target = '12.0'

end

