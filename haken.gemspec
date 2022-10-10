require_relative 'lib/haken/version'

Gem::Specification.new do |spec|
  spec.name          = 'haken'
  spec.version       = Haken::VERSION
  spec.authors       = ['Davis Namsons']

  spec.summary       = 'Add load hooks into your views'
  spec.description   = 'Haken allows you to define places in your views where additional content can be injected from elsewhere(for example, a seperate rails engine)'
  spec.homepage      = 'https://github.com/dnamsons/haken'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
