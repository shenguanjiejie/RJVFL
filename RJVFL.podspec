Pod::Spec.new do |s|
  s.name         = "RJVFL"
  s.version      = "1.0.0"
  s.summary      = "iOS layout 封装,思路来源于VFL"
  s.homepage     = "https://github.com/shenguanjiejie/RJVFL"
  s.license = { :type => 'MIT'}
  s.author             = { "EnjoySR" => "835166018@qq.com" }
  s.social_media_url   = "https://github.com/shenguanjiejie"
  s.platform     = :ios, "10.0"
  s.source       = { :git => "https://github.com/shenguanjiejie/RJVFL.git", :tag => s.version }
  s.source_files  = "RJVFL/RJVFL/*.{h,m}"
  s.requires_arc = true
  #s.dependency "SDWebImage",'~>4.0'

end