$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'
require 'yaml'
require 'xmlsimple'
require 'ftools'
require 'mash'

require 'module_extensions'
require 'numeric_extensions'
require 'kernel_extensions'
require 'file_extensions'
require 'object_extensions'
require 'string_extensions'
require 'dvdprofiler_collection/optional_logger'
require 'dvdprofiler_collection/collection'
require 'dvdprofiler_collection/dvdprofiler_profile'
