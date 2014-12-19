module Autoparts
  module Packages
    class Libtool < Package
      name 'libtool'
      version '2.4.4'
      description 'libtool: a generic library support script that hides the complexity of using shared libraries behind a consistent, portable interface.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://ftpmirror.gnu.org/libtool/libtool-2.4.4.tar.gz'
      source_sha1 'bba19e682d80941cfb7467689dda2ad9f8f50494'
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
