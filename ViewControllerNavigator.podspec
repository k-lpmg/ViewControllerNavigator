Pod::Spec.new do |s|
  s.name         = "ViewControllerNavigator"
  s.version      = "0.1.0"
  s.summary      = "Moves to a specific ViewController in any iOS ViewStack situation"
  s.homepage     = "https://github.com/k-lpmg/ViewControllerNavigator"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "DongHee Kang" => "kanglpmg@gmail.com" }
  s.source       = { :git => "https://github.com/k-lpmg/ViewControllerNavigator.git", :tag => s.version.to_s }
  s.documentation_url = "https://github.com/k-lpmg/ViewControllerNavigator/blob/master/README.md"

  s.ios.source_files  = "Sources/**/*.swift"
  s.ios.deployment_target = "8.0"
end
