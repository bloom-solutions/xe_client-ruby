$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'xe_client'
require "yaml"
require "pry"

SPEC_DIR = Pathname.new(File.dirname(__FILE__))
CONFIG = YAML.load_file(SPEC_DIR.join("config.yml")).with_indifferent_access

Dir[SPEC_DIR.join("support", "*.rb")].each {|f| require f}
