module Autoparts
  module Packages
    class Libffi < Package
      name 'libffi'
      version '3.2.1'
      description 'Libffi: A Portable Foreign Function Interface Library'
      category Category::LIBRARIES

      source_url 'ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz'
      source_sha1 '280c265b789e041c02e5c97815793dfc283fb1e6'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--disable-debug", 
            "--disable-dependency-tracking",
          ]
          execute './configure', *args
          execute 'make -j1'
        end
      end


      def install
        Dir.chdir(name_with_version) do
          execute 'make install'
          execute 'make check'          
        end
      end
    end
  end
end
