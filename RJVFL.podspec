Pod::Spec.new do |s|
  s.name         = "RJVFL"
  s.version      = "1.0.4"
  s.summary      = "iOS layout 封装,思路来源于VFL"
  s.homepage     = "https://github.com/shenguanjiejie/RJVFL"
  s.license = { :type => 'MIT'}
  s.author             = { "shenguanjiejie" => "835166018@qq.com" }
  s.social_media_url   = "https://github.com/shenguanjiejie"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/shenguanjiejie/RJVFL.git", :tag => s.version }
  s.source_files  = "RJVFL/RJVFL/*.{h,m}"
  s.requires_arc = true

end
