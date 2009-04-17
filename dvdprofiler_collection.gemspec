# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dvdprofiler_collection}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roy Wright"]
  s.date = %q{2009-04-17}
  s.email = %q{roy@wright.org}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/dvdprofiler_collection.rb",
    "lib/dvdprofiler_collection/collection.rb",
    "lib/dvdprofiler_collection/dvdprofiler_profile.rb",
    "lib/dvdprofiler_collection/optional_logger.rb",
    "lib/file_extensions.rb",
    "lib/kernel_extensions.rb",
    "lib/module_extensions.rb",
    "lib/numeric_extensions.rb",
    "lib/object_extensions.rb",
    "lib/string_extensions.rb",
    "spec/collection_spec.rb",
    "spec/dvdprofiler_profile_spec.rb",
    "spec/samples/Collection.xml",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/royw/dvdprofiler_collection}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/collection_spec.rb",
    "spec/spec_helper.rb",
    "spec/dvdprofiler_profile_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
