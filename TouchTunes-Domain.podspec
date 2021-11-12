Pod::Spec.new do |spec|
  spec.name          = "TouchTunes-Domain"
  spec.version       = "0.0.1"
  spec.summary       = "TouchTunes Domain"
  spec.description   = "TouchTunes Domain module"

  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "neymoura" => "neymourac@gmail.com" }
  spec.homepage      = "https://github.com/neymoura/touchtunes-sdk"

  spec.swift_version          = "5.3"
  spec.ios.deployment_target  = "14.5"

  spec.source        = { :git => "https://github.com/neymoura/touchtunes-domain.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Domain/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"

  spec.dependency "Moya", "14.0.0"
end
