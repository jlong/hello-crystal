CC      = crystal
CFLAGS  = build --release
RFLAGS  = run
RM      = rm -f


default: all

all: hello

hello: hello.cr
	$(CC) $(CFLAGS) hello.cr

clean:
	$(RM) hello

test: hello
	$(CC) $(RFLAGS) hello_spec.cr

tests: test
