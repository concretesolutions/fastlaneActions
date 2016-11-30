module Fastlane
  module Actions
    class TagBuildVersionAction < Action
      def self.run(params)
        UI.message("The tag_build_version plugin is working!")
      end

      def self.description
        "Defining git tags to manage build numbers"
      end

      def self.authors
        ["Bruno Mazzo"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Creating git tags to each build. Getting last build number and saving new build numbers to enable manage build numbers easily between all machines"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "TAG_BUILD_VERSION_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
