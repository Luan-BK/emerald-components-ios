Pod::Spec.new do |s|

  s.name          = "EmeraldComponents"
  s.version       = "0.13.0"
  s.summary       = "Stone Payments iOS Emerald Components."
  s.description   = "EmeraldComponents is UI dependency for Stone Payments."

  s.homepage      = "https://github.com/stone-payments/emerald-components-ios"
  s.license       = { :type => "Apache", :file => "LICENSE" }

  s.author        = { "Stone Payments" => "devportalcliente@stone.com.br" }
  s.platform      = :ios, "9.0"

  s.source        = { :git => "git@github.com:stone-payments/emerald-components-ios.git", :tag => s.version }
  s.source_files            = "EmeraldComponents/**/*.{h,m,swift}"
  s.ios.deployment_target   = "9.0"

  s.resources = "EmeraldComponents/**/*.{lproj,storyboard,xib,xcdatamodeld,plist,xcassets}"

  s.requires_arc = true

  s.frameworks = "Foundation"
  s.frameworks = "UIKit"

  s.dependency "JTAppleCalendar"
  s.dependency "InputMask"

end
