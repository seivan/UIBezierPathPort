Pod::Spec.new do |s|
  name           = "UIBezierPathPort"
  url            = "https://github.com/seivan/#{name}"
  git_url        = "#{url}.git"
  s.name         = name
  version        = "1.1.0"
  source_files   = "#{name}/**/*.{swift}"

  s.version      = version
  s.summary      = "Ported UIBezierPath API to NSBezierPath and typealiased"
  s.description  = <<-DESC

                    * Well-tested & documented and lightweight
                    * Easy selectors to get started quickly. 
                    
                    DESC

  s.homepage     = url
  s.license      = 'MIT'
  s.author       = { "Seivan Heidari" => "seivan.heidari@icloud.com" }
  
  s.source       = { :git => git_url, :tag => version}
  
  
  s.ios.deployment_target     = '9.0'
  s.osx.deployment_target     = '10.11'
  s.tvos.deployment_target    = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = source_files

  s.requires_arc = true
  s.social_media_url = 'https://twitter.com/seivan'



end
