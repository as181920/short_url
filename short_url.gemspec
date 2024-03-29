$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "short_url/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "short_url"
  spec.version     = ShortUrl::VERSION
  spec.authors     = ["Andersen Fan"]
  spec.email       = ["as181920@gmail.com"]
  spec.homepage    = ""
  spec.summary     = "Short url engine"
  spec.description = "create and interpret shortened URLs"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://gem.io-note.cn"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.1"
  spec.add_dependency "addressable"

  spec.add_development_dependency "sqlite3"
end
