case ARGV.size
when 0
  puts "Hello world!"
when 1
  printf "Hello %s!\n", ARGV[0]
else
  abort "hello: too many parameters"
end
exit 0
