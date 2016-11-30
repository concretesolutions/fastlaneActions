describe Fastlane::Actions::TagBuildVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The tag_build_version plugin is working!")

      Fastlane::Actions::TagBuildVersionAction.run(nil)
    end
  end
end
