require_relative "lib/rails_statusable/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_statusable"
  spec.version     = RailsStatusable::VERSION
  spec.authors     = ["aric.zheng"]
  spec.email       = ["1290657123@qq.com"]

  spec.summary     = "A Rails plugin for flexible, model-specific status fields with dynamic methods."
  spec.description = "Rails plugin that adds configurable status fields to models with dynamic methods like draft?, published?, etc."
  spec.homepage    = "https://github.com/afeiship/rails_statusable"
  spec.license     = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 6.0.0"
end