
Pod::Spec.new do |s|
  s.name         = "SQCategories"
  s.version      = "0.0.5"
  s.summary      = "a collection of useful Objective-C Categories extending iOS Frameworks."

  s.homepage     = "https://github.com/CoderSQ/SQCategories.git"

  s.license      = "MIT"

  s.author             = { "CoderSQ" => "steven_shuang@126.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/CoderSQ/SQCategories.git", :tag => "#{s.version}" }

  s.source_files  = "SQCategories", "SQCategories/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.framework  = "UIKit"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
