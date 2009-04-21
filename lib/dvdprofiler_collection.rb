$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'yaml'
require 'xmlsimple'
require 'ftools'
require 'mash'

# royw gems on github
require 'roys_extensions'

# local files
require 'dvdprofiler_collection/optional_logger'
require 'dvdprofiler_collection/collection'
require 'dvdprofiler_collection/dvdprofiler_profile'
