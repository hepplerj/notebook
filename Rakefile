# Jason Heppler
# Updated 2016-07-02

require "rake/clean"
require "stringex"
require "yaml"
require "fileutils"

# Set "rake preview" as default
task :default => :preview

# == Configuration =============================================================

# Load the configuration file
CONFIG = YAML.load_file("_config.yml")

# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")

# Directories
POSTS = "source/_note"
DRAFTS = "source/_drafts"
RDRAFTS = "source/_Rmd"

# == Tasks =====================================================================
desc "New draft post"
task :draft do |t|

  title         = get_stdin("What is the title of your post? ")
  md_extension  = get_stdin("Is this a Markdown or RMarkdown file (md or Rmd)? ")
  branch        = title.to_url
  filename      = "#{POSTS}/#{title}.#{md_extension}"

    puts "Checking out a new draft branch: #{POSTS}/#{branch}"
    `git checkout -b #{branch}`

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
    end
    `mvim #{filename}`
  end

  desc "New reading note"
  task :readnote do |t|

    title    = get_stdin("What is the title of your note? ")
    filename = "#{POSTS}/#{title.to_url}.md"

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
      FileUtils.mv("#{DRAFTS}/#{filename}", "#{POSTS}/#{filename}")
      puts "#{filename} was moved to '#{POSTS}'."
    else
      puts "Please choose a draft by the assigned number."
    end
  end

  desc "Preview the site with POW"
  task :preview do
    puts "Previewing the site locally with Jekyll."

    jekyllPid  = Process.spawn("bundle exec jekyll serve --watch --drafts --incremental --config _config.yml,_config-pow.yml")

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

  desc "deploy public site, rsync to server"
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
  sh %[mvim source/_drafts/*]
end

desc "Edit Rmd drafts"
task :rwrite do
  sh %[mvim source/_Rmd/*]
end

desc "Show Jekyll version"
task :version do
  system "jekyll --version"
end
