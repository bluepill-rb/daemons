lib_dir = File.expand_path(File.join(File.split(__FILE__)[0], '../../lib'))

if File.exists?(File.join(lib_dir, 'daemons.rb'))
  $LOAD_PATH.unshift lib_dir
else
  require 'rubygems' rescue nil
end


require 'daemons'

testfile = File.expand_path(__FILE__) + '.log'


# On the first call to <tt<call</tt>, an application group (accessible by <tt>Daemons.group</tt>)
# will be created an the options will be kept within, so you only have to specify
# <tt>:multiple</tt> once.
#

options = {
#  :ontop => true,
  :multiple => true
}


Daemons.call(options) do
  File.open(testfile, 'w') {|f|
    f.puts "test"
  }

  loop { puts "1"; sleep 5 }
end
puts "first task started"

Daemons.call do
  loop { puts "2"; sleep 4 }
end
puts "second task started"

# NOTE: this process will exit after 5 seconds
Daemons.call do
  puts "3"
  sleep 5
end
puts "third task started"

puts "waiting 20 seconds..."
sleep(20)

# This call would result in an exception as it will try to kill the third process 
# which has already terminated by that time; but using the 'true' parameter forces the
# stop_all procedure.
puts "trying to stop all tasks..."
Daemons.group.stop_all(true)

puts "done"