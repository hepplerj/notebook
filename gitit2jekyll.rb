#!/usr/bin/ruby
# Converting .page files to .md for Jekyll processing.

require 'yaml'

file = ARGV[0]
yaml_data = YAML.load_file(file)

yaml_created = File.ctime(file)
yaml_modified = File.mtime(file)
yaml_title = file.to_s
yaml_categories = yaml_data["categories"]
yaml_categories.gsub!('-',' ')

text = File.open(file).read
text.gsub!(/\r\n?/, "\n")

puts "---"
puts "layout: post"
puts "title: '#{yaml_title}'"
puts "date: #{yaml_modified}"
puts "modified: #{yaml_created}"
puts "tags: #{yaml_categories}"
puts "categories: \n- "
puts text
puts "---"
