$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'titi'
require 'spec'
require 'spec/autorun'
require 'support/compare_to_standard_example'
Spec::Runner.configure do |config|

end
