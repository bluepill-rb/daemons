lib_dir = File.expand_path(File.join(File.split(__FILE__)[0], '../lib'))

if File.exists?(File.join(lib_dir, 'daemons.rb'))
  $LOAD_PATH.unshift lib_dir
else
  require 'rubygems' rescue nil
end

require 'daemons'


options = {
}

Daemons.run(File.join(File.split(__FILE__)[0], 'myserver_exiting.rb'), options)