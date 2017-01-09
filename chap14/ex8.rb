# program that reads its own source code and prints it on the screen
puts __FILE__ # name given after ruby. eg $ruby a/b/test.rb __FILE__ = a/b/test.rb
puts File.dirname(__FILE__)
puts File.basename(__FILE__)

File.open(__FILE__,'r') do |f|
  f.readlines.each {|line| STDOUT.puts line}
end

# __FILE__ == $0
# http://stackoverflow.com/questions/8577223/ruby-get-the-file-being-executed
