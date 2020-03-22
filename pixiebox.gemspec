# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pixiebox/constants'

Gem::Specification.new do |spec|
  spec.name          = "pixiebox"
  spec.version       = Pixiebox::VERSION
  spec.authors       = ['Aimeri Baddouh']
  spec.email         = ['aimeri@baddouh.com']

  spec.summary       = %q{Docker development simplified}
  spec.description   = <<-DESC
    Docker development simplified.
  DESC
  spec.homepage      = Pixiebox::HOMEPAGE
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|docs)/})
  end
  spec.required_ruby_version = ">= 2.0.0"

  spec.bindir        = 'bin'
  spec.executables   = ['pixiebox']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'byebug',           '~> 11.1.0'
  spec.add_development_dependency 'rspec',            '~> 3.8.0'
  spec.add_development_dependency 'rake',             '~> 13.0.0'
  spec.add_development_dependency 'aruba-turnip',     '~> 0.1.0'
  spec.add_development_dependency 'turnip',           '~> 4.1.0'
  spec.add_development_dependency 'aruba-doubles',    '~> 1.2.0'
  spec.add_development_dependency 'aruba',            '~> 0.14.1'
  spec.add_development_dependency 'rb-readline',      '~> 0.5.0'
  spec.add_development_dependency 'guard',            '~> 2.16.0'
  spec.add_development_dependency 'guard-rspec',      '~> 4.7.0'
  spec.add_development_dependency 'webmock',          '~> 3.8.0'
  spec.add_development_dependency 'climate_control',  '~> 0.2.0'


  spec.add_dependency 'thor',             '~> 1.0.0'
  spec.add_dependency 'ruby-progressbar', '~> 1.8.0'
  spec.add_dependency 'wisper',           '~> 2.0.0'
  spec.add_dependency 'tty-file',         '~> 0.8.0'
  spec.add_dependency 'tty-command',      '~> 0.9.0'
  spec.add_dependency 'tty-spinner',      '~> 0.9.0'
  spec.add_dependency 'ghost',            '~> 1.0.0'
  spec.add_dependency 'tty-platform',     '~> 0.3.0'
  spec.add_dependency 'tty-which',        '~> 0.4.0'
  spec.add_dependency 'inifile',          '~> 3.0.0'
end
