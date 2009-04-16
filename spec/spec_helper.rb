require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'dvdprofiler_collection'

TMPDIR = File.join(File.dirname(__FILE__), '../tmp')

Spec::Runner.configure do |config|

end
