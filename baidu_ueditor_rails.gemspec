$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "baidu_ueditor_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "baidu_ueditor_rails"
  s.version     = BaiduUeditorRails::VERSION
  s.authors     = ["doabit"]
  s.email       = ["doinsist@gmail.com"]
  s.homepage    = "https://github.com/baidu_ueditor_rails"
  s.summary     = "Baidu ueditor for rails."
  s.description = "Baidu ueditor for rails."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">=3.1.1"

  s.add_development_dependency "sqlite3"
end
