Pod::Spec.new do |spec|
  spec.name          = "TouchTunes-SDK"
  spec.version       = "0.0.1"
  spec.summary       = "TouchTunes SDK"
  spec.description   = "A simple iTunes API wrapper for make your daily job easier :)"

  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "neymoura" => "neymourac@gmail.com" }
  spec.homepage      = "https://github.com/neymoura/touchtunes-sdk"

  spec.swift_version          = "5.3"
  spec.ios.deployment_target  = "14.5"

  spec.source        = { :git => "https://github.com/neymoura/touchtunes-sdk.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "sdk/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

  spec.dependency "Moya", "14.0.0"
end
