Pod::Spec.new do |s|

  s.name         = "DMCategories"
  s.version      = "3.2.1"
  s.summary      = "Some categories for iOS developers"
  s.homepage     = "https://github.com/DimaAvvakumov/DMCategories.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Dmitry Avvakumov" => "avvakumov@it-baker.ru" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/DimaAvvakumov/DMCategories.git" }
  s.source_files = "categories/**/*.{h,m}"
  s.public_header_files = "categories/**/*.{h}"
  s.framework    = "UIKit"
  s.requires_arc = true

end
