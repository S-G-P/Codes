# -*- encoding: utf-8 -*-
# stub: icalendar 2.4.1 ruby lib

Gem::Specification.new do |s|
  s.name = "icalendar"
  s.version = "2.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ryan Ahearn"]
  s.date = "2016-09-04"
  s.description = "Implements the iCalendar specification (RFC-5545) in Ruby.  This allows\nfor the generation and parsing of .ics files, which are used by a\nvariety of calendaring applications.\n"
  s.email = ["ryan.c.ahearn@gmail.com"]
  s.homepage = "https://github.com/icalendar/icalendar"
  s.post_install_message = "HEADS UP! iCalendar 2.0 is not backwards-compatible with 1.x. Please see the README for the new syntax\n\nHEADS UP! icalendar 2.2.0 switches to non-strict parsing as default. Please see the README if you\nrely on strict parsing for information on how to enable it.\n\nActiveSupport is required for TimeWithZone support, but not required for general use.\n"
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.4.5.1"
  s.summary = "A ruby implementation of the iCalendar specification (RFC-5545)."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<tzinfo>, ["~> 1.1"])
      s.add_development_dependency(%q<tzinfo-data>, ["~> 1.2014"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.2"])
      s.add_development_dependency(%q<i18n>, ["< 0.7.0"])
      s.add_development_dependency(%q<timecop>, ["~> 0.7.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.8"])
    else
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<tzinfo>, ["~> 1.1"])
      s.add_dependency(%q<tzinfo-data>, ["~> 1.2014"])
      s.add_dependency(%q<activesupport>, ["~> 3.2"])
      s.add_dependency(%q<i18n>, ["< 0.7.0"])
      s.add_dependency(%q<timecop>, ["~> 0.7.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<tzinfo>, ["~> 1.1"])
    s.add_dependency(%q<tzinfo-data>, ["~> 1.2014"])
    s.add_dependency(%q<activesupport>, ["~> 3.2"])
    s.add_dependency(%q<i18n>, ["< 0.7.0"])
    s.add_dependency(%q<timecop>, ["~> 0.7.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.8"])
  end
end
