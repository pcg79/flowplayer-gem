Gem::Specification.new do |s|
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name = %q{flowplayer}
  s.version = '0.0.5'
  s.platform    = Gem::Platform::RUBY

  s.authors = ["Scott Davis"]
  s.description = %q{Flowplayer helper for Rails 3}
  s.summary = %q{Flowplayer helper for Rails 3}
  s.email = %q{jetviper21@gmail.com}

  s.date = Date.today.to_s
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'

  s.homepage = %q{https://github.com/jetviper21/flowplayer-gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.0.0"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "mocha"
  s.add_dependency "json"

end
