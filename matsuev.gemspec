$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "matsuev/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "matsuev_somebook"
  s.version     = Matsuev::VERSION
  s.authors     = ["Gregory Eremin"]
  s.email       = ["magnolia_fan@me.com"]
  s.homepage    = "https://github.com/somebook/matsuev.shard"
  s.summary     = "Somebook Matsuev shard"
  s.description = "Rails mountable engine that provides embedded shard functionality"

  s.files = Dir["{app,config,lib}/**/*"] + ["README.md"]
end
