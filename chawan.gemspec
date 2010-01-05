# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{chawan}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-01-06}
  s.description = %q{A cup for chasen that provides an easy to use for extracting Japanese}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/chawan", "lib/chawan/analyzers.rb", "lib/chawan/analyzers", "lib/chawan/analyzers/mecab_analyzer.rb", "lib/chawan/analyzers/chasen_analyzer.rb", "lib/chawan/analyzers/abstract_analyzer.rb", "lib/chawan/analyzers/manager.rb", "lib/chawan/node.rb", "lib/chawan/commands.rb", "lib/chawan/nodes.rb", "lib/chawan.rb", "spec/chasen_spec.rb", "spec/api_spec.rb", "spec/nodes_spec.rb", "spec/mecab_spec.rb", "spec/provide_helper.rb", "spec/analyzer_spec.rb", "spec/fixtures", "spec/fixtures/example1.txt", "spec/fixtures/example2.txt", "spec/fixtures/example3.txt", "spec/spec_helper.rb", "spec/node_spec.rb"]
  s.homepage = %q{http://github.com/maiha/chawan}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A cup for chasen that provides an easy to use for extracting Japanese}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
