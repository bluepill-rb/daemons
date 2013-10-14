# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'daemons/version'

Gem::Specification.new do |spec|
  spec.name              = "mlanett-daemons"
  spec.version           = Daemons::VERSION

  spec.authors           = ["Thomas Uehlinger"]
  spec.autorequire       = %q{daemons}
  spec.date              = %q{2009-08-26}
  spec.description       = %q{Daemons provides an easy way to wrap existing ruby scripts (for example a self-written server)  to be run as a daemon and to be controlled by simple start/stop/restart commands.  You can also call blocks as daemons and control them from the parent or just daemonize the current process.  Besides this basic functionality, daemons offers many advanced features like exception  backtracing and logging (in case your ruby script crashes) and monitoring and automatic restarting of your processes if they crash.}
  spec.email             = %q{th.uehlinger@gmx.ch}
  spec.has_rdoc          = true
  spec.homepage          = %q{http://daemons.rubyforge.org}
  spec.rubyforge_project = %q{daemons}
  spec.summary           = %q{A toolkit to create and control daemons in different ways}

  spec.files             = `git ls-files`.split($/)
  spec.executables       = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files        = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths     = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
