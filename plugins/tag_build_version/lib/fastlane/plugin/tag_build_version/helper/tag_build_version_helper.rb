module Fastlane
  module Helper
    class TagBuildVersionHelper
      # class methods that you define here become available in your action
      # as `Helper::TagBuildVersionHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the tag_build_version plugin helper!")
      end
    end
  end
end
