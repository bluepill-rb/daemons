require "bundler/gem_tasks"
require "rdoc/task"

task :upload do
  sh "scp -r html/* uehli@rubyforge.org:/var/www/gforge-projects/daemons"
end

desc "Create the RDOC html files"
rd = Rake::RDocTask.new("rdoc") do |rdoc|
  rdoc.rdoc_dir = 'html'
  rdoc.title    = "Daemons"
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << 'README'
  rdoc.rdoc_files.include('README', 'TODO', 'Releases')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Version bump"
task :version_bump do
  # VERSION = "1.1.10.2"
  lines = File.open("lib/daemons/version.rb") { |io| io.readlines }
  lines = lines.map do |line|
    if line =~ /VERSION = "(\d+(\.\d+)+)"/
      version = $1.split(/\./).map(&:to_i)
      version[-1] += 1
      line.gsub(/".*"/) { '"' + version.join(".") + '"' }
    else
      line
    end
  end
  File.open("lib/daemons/version.rb","w") { |io| io.puts lines }
  `git commit -m "Version bump" lib/daemons/version.rb`
end
