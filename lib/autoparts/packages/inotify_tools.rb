module Autoparts
  module Packages
    class InotifyTools < Package
      name 'inotify-tools'
      version '3.14'
      description 'C library and a set of command-line programs for Linux providing a simple interface to inotify'
      category Category::UTILITIES
      
      source_url 'http://github.com/downloads/rvoicilas/inotify-tools/inotify-tools-3.14.tar.gz'
      source_sha1 '0446706d54ca4ae42e076505f5904995ca970c1c'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}"
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
