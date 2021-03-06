Pod::Spec.new do |spec|
  spec.name          = "FakefyDomain"
  spec.version       = "0.0.5"
  spec.summary       = "Fakefy Domain"
  spec.description   = "Fakefy Domain module"

  spec.license       = { :type => "MIT", :file => "LICENSE" }
  spec.author        = { "neymoura" => "neymourac@gmail.com" }
  spec.homepage      = "https://github.com/fakefy/fakefy-domain"

  spec.swift_version          = "5.3"
  spec.ios.deployment_target  = "14.5"

  spec.source        = { :git => "https://github.com/fakefy/fakefy-domain.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Domain/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
end
