if (ARGV.size > 0)
  if (ARGV.size < 2)
    printf("Hello %s!\n", ARGV[0])
  else
    abort "hello: too many parameters"
  end
else
  puts "Hello world!"
end
exit(0)
