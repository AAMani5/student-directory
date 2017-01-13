# same as ex8.rb just trying out with $0 instead of __FILE__

# program that reads its own source code and prints it on the screen
puts $0 # name given after ruby. eg $ruby a/b/test.rb $0 = a/b/test.rb (here $0 = ex9.rb)
puts File.dirname($0) # directory of the file from the above example its a/b/(here its . i.e current directory)
puts File.basename($0) # from the above example its test.rb (here its ex9.rb)

File.open($0,'r') do |f|
  f.readlines.each {|line| STDOUT.puts line}
end

# __FILE__ == $0
# http://stackoverflow.com/questions/8577223/ruby-get-the-file-being-executed
