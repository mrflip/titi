# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{titi}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mrflip"]
  s.date = %q{2010-04-17}
  s.description = %q{Facade adapting apis to activity streams spec}
  s.email = %q{flip@infochimps.org}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "examples/twitter.rb",
     "lib/titi.rb",
     "lib/titi/adaptor.rb",
     "lib/titi/matcher.rb",
     "lib/titi/parse_tree.rb",
     "lib/titi/provider.rb",
     "lib/titi/provider/README.textile",
     "lib/titi/provider/activity_streams.rb",
     "lib/titi/provider/tripit.rb",
     "lib/titi/provider/twitter.rb",
     "lib/titi/provider/twitter/models.rb",
     "notes/jeweler-gen.sh",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/titi_spec.rb",
     "titi.gemspec"
  ]
  s.homepage = %q{http://github.com/mrflip/titi}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Emit and consume Activity Streams from a wide variety of sources}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/titi_spec.rb",
     "examples/twitter.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<restclient>, [">= 0.0.0"])
      s.add_runtime_dependency(%q<wukong>, [">= 0.0.0"])
      s.add_runtime_dependency(%q<active_support>, [">= 0.0.0"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<restclient>, [">= 0.0.0"])
      s.add_dependency(%q<wukong>, [">= 0.0.0"])
      s.add_dependency(%q<active_support>, [">= 0.0.0"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<restclient>, [">= 0.0.0"])
    s.add_dependency(%q<wukong>, [">= 0.0.0"])
    s.add_dependency(%q<active_support>, [">= 0.0.0"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

