require 'git'

module Fastlane
  module Actions
    class SetTagBuildVersionAction < Action
      def self.run(params)
        build_number ||= params[:build_version]
        remote ||= params[:remote_name] || 'origin'
        should_push ||= params[:push] || false
        tag_identifier ||= params[:identifier]
        current_path ||= params[:path_to_git] || Dir.pwd

        local_git = Git.open(current_path)

        local_git.add_tag("#{tag_identifier}-#{build_number}")

        if should_push
          local_git.push(remote, git.current_branch, { tags: true })
        end
      end

      def self.description
        "Add build version tag to git"
      end

      def self.authors
        ["Bruno Mazzo"]
      end

      def self.return_value
        #"Last build number basead on the last build tag find on the git remote"
      end

      def self.details
        # Optional:
        "We create a new tag with build version pattern and add it to git. Push to remote are not done by default."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :identifier,
                                  env_name: "TAG_BUILD_VERSION_IDENFITIER",
                               description: "The app identifier",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :path_to_git,
                                  env_name: "TAG_BUILD_VERSION_GIT_PATH",
                               description: "Path to the .git folder index",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :build_version,
                                  env_name: "TAG_BUILD_VERSION",
                               description: "Build version to set a tag",
                                  optional: false,
                                      type: Integer),
          FastlaneCore::ConfigItem.new(key: :remote_name,
                                  env_name: "TAG_BUILD_VERSION_REMOTE_NAME",
                               description: "Name of the remove to push tag",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :push,
                                  env_name: "TAG_BUILD_VERSION_PUSH_TAGS",
                               description: "Should push tags to remote?",
                                  optional: true,
                                      type: Bool),

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
