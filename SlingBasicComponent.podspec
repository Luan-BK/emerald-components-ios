Pod::Spec.new do |s|

  s.name          = "SlingBasicComponent"
  s.version       = "0.13.0"
  s.summary       = "Stone Payments Basic UI Components."
  s.description   = "SlingBasicComponent is UI dependency for Stone Payments."

  s.homepage      = "https://github.com/stone-payments/sling-ios-basic-component"
  s.license       = { :type => "Apache", :file => "LICENSE" }

  s.author        = { "Stone Payments" => "devportalcliente@stone.com.br" }
  s.platform      = :ios, "9.0"

  s.source        = { :git => "git@github.com:stone-payments/sling-ios-basic-component.git", :tag => s.version }
  s.source_files            = "SlingBasicComponent/**/*.{h,m,swift}"
  s.ios.deployment_target   = "9.0"

  s.resources = "SlingBasicComponent/**/*.{lproj,storyboard,xib,xcdatamodeld,plist,xcassets}"

  s.requires_arc = true

  s.frameworks = "Foundation"
  s.frameworks = "UIKit"

  s.dependency "JTAppleCalendar"
  s.dependency "InputMask"

end
