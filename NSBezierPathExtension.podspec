Pod::Spec.new do |s|
  name           = "NSBezierPathExtension"
  url            = "https://github.com/seivan/#{name}"
  git_url        = "#{url}.git"
  s.name         = name
  version        = "1.0.0"
  source_files   = "#{name}/**/*.{swift}"

  s.version      = version
  s.summary      = "NSBezierPathExtension extension to mimic UIBezierPath API - also typealiased"
  s.description  = <<-DESC

                    * Well-tested & documented and lightweight
                    * Easy selectors to get started quickly. 
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com" }
  
  s.source       = { :git => git_url, :tag => version}
  
  
  s.platform  = :ios, "8.0"

  s.source_files = source_files

  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/seivan'



end
