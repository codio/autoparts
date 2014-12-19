module Autoparts
  module Packages
    class Jruby < Package
      name 'jruby'
      version '1.7.17'
      description 'jRuby: The Ruby Programming Language on the JVM'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://s3.amazonaws.com/jruby.org/downloads/1.7.17/jruby-bin-1.7.17.tar.gz'
      source_sha1 'e4621bbcc51242061eaa9b62caee69c2a2b433f0'
      source_filetype 'tar.gz'

      def install
        prefix_path.mkpath
        Dir.chdir(name_with_version) do
          execute 'cp', '-r', '.', prefix_path
        end
      end
    end
  end
end
