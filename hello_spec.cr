require "spec"

describe "./hello" do
  it "prints 'Hello world!'" do
    result = run "./hello"
    result[:output].should eq("Hello world!\n")
    result[:status].should eq(0)
  end

  it "prints 'Hello John!'" do
    result = run "./hello John"
    result[:output].should eq("Hello John!\n")
    result[:status].should eq(0)
  end

  it "prints 'Hello John Jacob Jingleheimer Schmidt!'" do
    result = run "./hello 'John Jacob Jingleheimer Schmidt'"
    result[:output].should eq("Hello John Jacob Jingleheimer Schmidt!\n")
    result[:status].should eq(0)
  end

  it "errors gracefully with more than one parameter" do
    result = run "./hello a b c"
    result[:output].should eq("hello: too many parameters\n")
    result[:status].should eq(256)
  end
end

def run(command : String)
  io = MemoryIO.new
  status = Process.run(command, shell: true, output: io, error: io)
  { output: io.to_s, status: status.exit_status }
end
