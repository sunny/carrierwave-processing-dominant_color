# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carrierwave/processing/dominant_color/version'

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-processing-dominant_color"
  spec.version       = CarrierWave::Processing::DominantColor::VERSION
  spec.authors       = ["Sunny Ripert"]
  spec.email         = ["sunny@sunfox.org"]
  spec.summary       = %q{Store the dominant color of an image with CarrierWave}
  spec.description   = %q{Store the dominant color of the images when you upload them to your Rails application using the CarrierWave gem.}
  spec.homepage      = "https://github.com/sunny/carrierwave-processing-dominant_color"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "miro"
end
