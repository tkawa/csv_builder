Gem::Specification.new do |s|
  s.name        = 'csv_builder'
  s.version     = '3.0.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Econsultancy', 'Vidmantas Kabosis', 'Gabe da Silveira']
  s.email       = 'gabe@websaviour.com'
  s.homepage    = 'http://github.com/gtd/csv_builder'
  s.summary     = 'CSV template handler for Rails'
  s.description = 'CSV template handler for Rails.  Enables :format => \'csv\' in controllers, with templates of the form report.csv.csvbuilder.'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files == {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ['README.md']
  s.require_paths = ['lib']

  s.licenses = ['MIT']

  s.add_dependency 'actionpack', ['>= 3.0.0']
  s.add_dependency 'fastercsv' if RUBY_VERSION.to_f < 1.9

  s.add_development_dependency 'rails', ['>= 3.0.0']
  s.add_development_dependency 'rspec-rails', ['~> 2.5']
  s.add_development_dependency 'sqlite3'
end

