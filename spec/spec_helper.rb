require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'dvdprofiler_collection'

TMPDIR = File.join(File.dirname(__FILE__), '../tmp')
SAMPLES_DIR = File.join(File.dirname(__FILE__), 'samples')

require 'cache_extensions'
CacheExtensions.attach_to_read_page_classes(SAMPLES_DIR)

Spec::Runner.configure do |config|

end
