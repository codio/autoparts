module Autoparts
  module Packages
    class Mono < Package
      name 'mono'
      version '4.0.3'
      description 'Mono: a software platform designed to allow developers to easily create cross platform applications.'
      source_url 'http://download.mono-project.com/sources/mono/mono-4.0.3.20.tar.bz2'
      source_sha1 'edd89c269fb0884fd002dc9a0bc09c8513c6efa0'
      source_filetype 'tar.bz2'
      category Category::PROGRAMMING_LANGUAGES

      def compile
        Dir.chdir(name_with_version) do
          execute './configure', "--prefix=#{prefix_path}"
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

