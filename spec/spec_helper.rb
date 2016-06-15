require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV["RAILS_ENV"] ||= 'test'
rails_root = File.expand_path('../rails_app', __FILE__)
require rails_root + '/config/environment.rb'

require 'rspec/rails'

TEST_DATA = [
  ['Lorem', 'ipsum'],
  ['Lorem ipsum dolor sit amet,' 'consectetur adipiscing elit. Sed id '],
  ['augue! "3" !@#$^&*()_+_', 'sed risus laoreet condimentum ac nec dui.'],
  ['\'Aenean sagittis lorem ac', 'lorem comm<s>odo nec eleifend risus']
]

def generate(options = {}, data = TEST_DATA)
  CSV.generate(options) do |csv|
    data.each do |row|
      csv << row
    end
  end
end

RSpec.configure do |config|
    config.infer_spec_type_from_file_location!
end
