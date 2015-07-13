Gem::Specification.new do |s|
  s.name = 'openvas-omp-ruby'
  s.license = 'MIT'
  s.version = '0.0.5'
  s.platform = Gem::Platform::RUBY
  s.authors = ["Vlatko Kosturjak", "jackdfw"]
  s.summary = "OpenVAS manager communication library"
  s.description = "This library is used for communication with OpenVAS manager over OMP You can start, stop, pause and resume scan. Watch progress and status of scan, download report, etc."

  s.files = `git ls-files lib`.split("\n") + ['Gemfile','Rakefile','README.md', 'MIT-LICENSE']
  s.test_files = `git ls-files test`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.2'
end
