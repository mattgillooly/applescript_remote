require 'applescript_remote'

describe ApplescriptRemote do

  let(:applescript) { 'tell application "Safari" to activate' }
  subject { ApplescriptRemote }

  it "creates a Command" do
    command = stub(:command)
    ApplescriptRemote::Command.stub(:new).with(applescript).and_return(command)

    command.should_receive(:execute).ordered
    command.should_receive(:save!).ordered

    subject.execute(applescript)
  end

end
