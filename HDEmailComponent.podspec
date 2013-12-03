Pod::Spec.new do |s|
  s.name     = 'HDEmailComponent'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'A simple email singleton.’
  s.homepage = 'https://github.com/jgorecki/HDEmailComponent'
  s.author   = { 'Joe Gorecki' => 'j@harbordev.com' }
  s.source   = { :git => 'https://github.com/jgorecki/HDWebBrowser',:branch=>'master', :tag => ‘1.0.0’ }
  s.description  = 'Just a singleton for sending email.’
  s.source_files = ‘HDEmailComponent/HDEmailController/*.{h,m,xib}'
  s.requires_arc = true
  s.frameworks = 'MessageUI'
  s.platform = :ios
end