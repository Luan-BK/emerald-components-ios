Pod::Spec.new do |s|

  s.name          = "EmeraldComponents"
  s.version       = "0.1.4"
  s.summary       = "Stone Payments iOS Emerald Components."
  s.description   = "EmeraldComponents is UI dependency for Stone Payments."

  s.homepage      = "https://github.com/stone-payments/emerald-components-ios"
  s.license       = { :type => "Apache", :file => "LICENSE" }

  s.author        = { "Stone Payments" => "componentesdocliente@stone.com.br" }
  s.platform      = :ios, "9.0"

  s.source        = { :git => "https://github.com/stone-payments/emerald-components-ios.git", :tag => s.version }
  s.source_files            = "EmeraldComponents/**/*.{h,m,swift}"
  s.ios.deployment_target   = "9.0"

  s.xcconfig = { "APPLY_RULES_IN_COPY_FILES" => "YES", "STRINGS_FILE_OUTPUT_ENCODING" => "binary" }

  s.resources = "EmeraldComponents/**/*.{lproj,strings,storyboard,xib,xcdatamodeld,xcassets}"

  s.requires_arc = true

  s.frameworks = "Foundation"
  s.frameworks = "UIKit"

  s.dependency "JTAppleCalendar"
  s.dependency "InputMask"

end
