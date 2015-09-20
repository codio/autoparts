module Autoparts
  module Packages
    class Dart < Package
      name 'dart'
      version '1.11.1'
      description 'Dart is a new platform for scalable web app engineering'
      source_url 'https://storage.googleapis.com/dart-archive/channels/stable/release/1.11.1/sdk/dartsdk-linux-x64-release.zip'
      source_sha1 '91c5102df157c09d15ba0ffa415823a9ae99c0da'
      source_filetype 'zip'
      category Category::PROGRAMMING_LANGUAGES

      def install
        prefix_path.mkpath
        Dir.chdir(extracted_archive_path + 'dart-sdk') do
          execute 'cp', '-r', '.', prefix_path
        end
      end
    end
  end
end

