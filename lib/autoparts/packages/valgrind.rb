module Autoparts
  module Packages
    class Valgrind < Package
      name 'valgrind'
      version '3.10.1'
      description 'Valgrind: a system for debugging and profiling Linux programs.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://www.valgrind.org/downloads/valgrind-3.10.1.tar.bz2'
      source_sha1 '15518427de842547ffa84eff8b2b67f3b16581a8'
      source_filetype 'tar.bz2'

      def compile
        args = [
          "--prefix=#{prefix_path}",
        ]

        Dir.chdir(name_with_version) do
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
