# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dvdprofiler_collection}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roy Wright"]
  s.date = %q{2009-04-21}
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
      s.add_runtime_dependency(%q<royw-roys_extensions>, [">= 0.0.2"])
      s.add_runtime_dependency(%q<royw-read_page_cache>, [">= 0.0.1"])
    else
      s.add_dependency(%q<royw-roys_extensions>, [">= 0.0.2"])
      s.add_dependency(%q<royw-read_page_cache>, [">= 0.0.1"])
    end
  else
    s.add_dependency(%q<royw-roys_extensions>, [">= 0.0.2"])
    s.add_dependency(%q<royw-read_page_cache>, [">= 0.0.1"])
  end
end
