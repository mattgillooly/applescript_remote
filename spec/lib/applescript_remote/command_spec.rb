require 'applescript_remote/command'

describe ApplescriptRemote::Command do

  let(:applescript) { 'tell application "Safari" to activate' }
  subject { ApplescriptRemote::Command.new(applescript) }

  it "runs AppleScript code" do
    AppleScript.should_receive(:execute).with(applescript)
    subject.execute
  end

end
