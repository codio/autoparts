module Autoparts
  module Packages
    class Re2c < Package
      name 're2c'
      version '0.13.7.5'
      description 'Re2C: a tool for writing very fast and very flexible scanners.'
      category Category::LIBRARIES

      source_url 'http://sourceforge.net/projects/re2c/files/re2c/0.13.7.5/re2c-0.13.7.5.tar.gz'
      source_sha1 '4786a13be61f8249f4f388e60d94bb81db340d5c'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
          ]
          execute './configure', *args
          execute 'make'
        end
      end


      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
        end
      end
    end
  end
end
