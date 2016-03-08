require 'yaml'

yml = YAML::load(File.open(ARGV[0]))
dated = yml['date']
puts dated
