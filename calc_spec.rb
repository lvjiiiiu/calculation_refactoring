require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec"
end

require "rspec"
require "rspec/autorun"


Rspec.describe do
  [
    ['1kg + 3kg', '4kg'],
    ['1kg + 100g', '1100g'],
    ['1kg + 200g - 10mg', '1199990mg'],
    ['100g + 2kg * 3', '6100g'],
    ['100g / 4 + 2kg * 3', '6025g'],
    ['1kg + 300g / 7', '1042g'],
  ].each do |(arg, result)|
    it "#{arg} = #{resule}" do 
      expect { system("./calc", arg)}.to output("#{resule}\n").to_stdout_from_any_process
    end
  end

  [
    '+ 3g + 100mg',
    '1kg + 3t',
    '1kg * 3g'
  ].each do |arg|
    it "invalid argument: #{arg}" do
      expect { system("./calc", arg)}.to output.to_stderr_from_any_process