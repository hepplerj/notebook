# Jason Heppler
# Updated 2015-11-21

require "rake/clean"
require "stringex"
require "yaml"
require "fileutils"

# Configuration

# Set "rake watch" as default
task :default => :preview

# == Configuration =============================================================

# Set "rake watch" as default task
task :default => :watch

# Load the configuration file
CONFIG = YAML.load_file("_config.yml")

# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")

# Directories
POSTS = "_posts"
DRAFTS = "_drafts"
RDRAFTS = "_Rmd"

# == Helpers ===================================================================
# Execute a system command
def execute(command)
  system "#{command}"
end

# Save the file with the title in the YAML front matter
def write_file(content, title, directory, filename)
  parsed_content = "#{content.sub("title:", "title: \"#{title}\"")}"
  File.write("#{directory}/#{filename}", parsed_content)
  puts "#{filename} was created in '#{directory}'."
end

# Create the file with the slug and open the default editor
def create_file(directory, filename, content, title, editor)
  FileUtils.mkdir(directory) unless File.exists?(directory)
  if File.exists?("#{directory}/#{filename}")
    raise "The file already exists."
  else
    write_file(content, title, directory, filename)
    if editor && !editor.nil?
      sleep 1
      execute("#{editor} #{directory}/#{filename}")
    end
  end
end

def check_title(title)
  if title.nil? or title.empty?
    raise "Please add a title to your file."
  end
end

# Transform the filename and date to a slug
def transform_to_slug(title, extension)
  characters = /("|'|!|\?|:|\s\z)/
  whitespace = /\s/
  "#{title.gsub(characters,"").gsub(whitespace,"-").downcase}.#{extension}"
end

# Read the template file
def read_file(template)
  File.read(template)
end

# == Tasks =====================================================================
desc "New draft post"
task :rdraft do |t|

  title    = get_stdin("What is the title of your post? ")
  filename = "_Rmd/#{title.to_url}.Rmd"

  puts "Creating new draft: #{filename}"
  open(filename, "w") do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "tags: []"
    post.puts "categories: "
    post.puts "- "
    post.puts "..."
    post.puts "\n"
    post.puts "* Table of Contents\n{:toc}"
  end
end

desc "New draft post"
task :draft do |t|

  title    = get_stdin("What is the title of your post? ")
  filename = "_drafts/#{title.to_url}.md"

  puts "Creating new draft: #{filename}"
  open(filename, "w") do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "tags: []"
    post.puts "categories: "
    post.puts "- "
    post.puts "..."
    post.puts "\n"
    post.puts "* Table of Contents\n{:toc}"
  end
end


desc "New reading note"
task :readnote do |t|

  title    = get_stdin("What is the title of your note? ")
  filename = "_drafts/#{title.to_url}.md"

  puts "Creating new draft: #{filename}"
  open(filename, "w") do |post|
    post.puts "---"
    post.puts "layout: post"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "tags: []"
    post.puts "categories: "
    post.puts "- Readings"
    post.puts "..."
    post.puts "\n"
    post.puts "* Table of Contents\n{:toc}"
    post.puts "\n<h4>{% reference #{title} %}</h4>"
  end
end

desc "Move a post from _drafts to _posts"
task :publish do
  extension = "md"
  files = Dir["#{DRAFTS}/*.#{extension}"]
  files.each_with_index do |file, index|
    puts "#{index + 1}: #{file}".sub("#{DRAFTS}/", "")
  end
  print "> "
  number = $stdin.gets
  if number =~ /\D/
    filename = files[number.to_i - 1].sub("#{DRAFTS}/", "")
    FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{DATE}-#{filename}")
    puts "#{filename} was moved to '#{POSTS}'."
  else
    puts "Please choose a draft by the assigned number."
  end
end

desc "Preview the site with POW"
task :preview do
  puts "Previewing the site locally with Jekyll."

  jekyllPid  = Process.spawn("jekyll serve --watch --drafts --incremental --config _config.yml, _config-pow.yml")

  trap("INT") {
    [jekyllPid].each { |pid| Process.kill(9, pid) rescue Errno::ESRCH }
    exit 0
  }

  [jekyllPid].each { |pid| Process.wait(pid) }
end

task :rmdpost do
  system "Rscript _Rmd/rmd2jekyll.R"
end

task :mdpost do
  system "Rscript _md/md2jekyll.R"
end

desc "rsync to server"
task :rsync do
	puts "\nDeploying the site via rsync..."

	ssh_port       = "22"
	ssh_user       = "jasonhep@jasonheppler.org"
	rsync_delete   = true
	rsync_options  = "--checksum --stats -avz -e"
	public_dir     = "public/"
	document_root  = "~/public_html/notebook/"

	exclude = ""
	if File.exists?('./rsync-exclude')
		exclude = "--exclude-from '#{File.expand_path('./rsync-exclude')}'"
	end

	ok_failed system("rsync #{rsync_options} 'ssh -p #{ssh_port}' #{exclude} #{"--delete" unless rsync_delete == false} #{public_dir}/ #{ssh_user}:#{document_root}")
end

def ok_failed(condition)
  if (condition)
    puts "OK"
  else
    puts "FAILED"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end

CLOBBER.include('public/*')

desc "Edit drafts"
task :write do
  sh %[mvim _drafts/*]
end

desc "Edit Rmd drafts"
task :rwrite do
  sh %[mvim _Rmd/*]
end

task :version do
  system "jekyll --version"
end
