#!/usr/bin/python.7

import yaml
import sys
import os
import os.path, time

# Note that .page files are inside a directory called `raw/`.
# There's probably much better ways to do what I'm doing, but hey. I made this quick.
# Jason A. Heppler | heppler.mit-license.com | 2015-11-14

def get_yaml(f):
  pointer = f.tell()
  if f.readline() != '---\n':
    f.seek(pointer)
    return ''
  readline = iter(f.readline, '')
  readline = iter(readline.next, '...\n')
  return ''.join(readline)

for filename in sys.argv[1:]:
  with open(filename) as f:
    config = yaml.load(get_yaml(f))
    yaml_title = os.path.splitext(filename)[0] # remove file extension
    yaml_date = time.ctime(os.path.getctime(filename))
    yaml_modified = time.ctime(os.path.getmtime(filename))
    yaml_categories = config["categories"]
    text = f.read()
    
    print "---"
    print "layout: post"
    print "title: " + '"' + yaml_title + '"'
    print "date: " + yaml_modified
    print "modified: " + yaml_date
    print "tags: " + '[' + yaml_categories + ']'
    print "categories: \n- "
    print "---"
    print text

