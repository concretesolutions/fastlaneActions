require 'git'

module Fastlane
  module Actions
    class TagBuildVersionAction < Action
      def self.run(params)
        tag_identifier ||= params[:identifier]
        current_path ||= params[:path_to_git] || Dir.pwd

        local_git = Git.open(current_path)
        local_git.fetch
        tags = local_git.tags

        tags.each do |tag|
          puts tag.name
        end

        build_versions_tags = tags.select do |tag|
          tag.name.include? tag_identifier
        end

        build_versions = build_versions_tags.map do |build_version_tag|
          build_version_tag.name.sub(/#{Regexp.escape("#{tag_identifier}-")}/, '')
        end

        build_versions.max.to_i || 0
      end

      def self.description
        "Recover last build tag for a identifier"
      end

      def self.authors
        ["Bruno Mazzo"]
      end

      def self.return_value
        "Last build number basead on the last build tag find on the git remote"
      end

      def self.details
        # Optional:
        "We search on the git for the last tag with the pattern :identifier_build and recovery the max build value."
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
                                      type: String)
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
