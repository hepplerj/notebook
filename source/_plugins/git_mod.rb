# Author: Lincoln Mullen
# Original author: Carl Boettiger, @cboettig
# License: MIT
#
# This Jekyll plugin is modified from an original by Carl Boettiger. The 
# suggested modification came from this Stack Overflow question:
# http://stackoverflow.com/questions/36263812/sort-by-a-modified-variable-in-liquid-and-jekyll/36267438#36267438

require 'git'

Jekyll::Hooks.register :documents, :pre_render do |document, payload|

  g = Git.open(".") 
  begin
    git_mod = g.log(1).object(document.path).first.date
  rescue NoMethodError
    $stderr.print "\nNo method for #{document.path}. It probably has not been committed to the Git repository"
    git_mod = Time.new
  end
  document.data['git_modified'] = git_mod

end