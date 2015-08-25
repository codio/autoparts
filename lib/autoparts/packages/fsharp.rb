# mozroots --import --sync
module Autoparts
  module Packages
    class Fsharp < Package
      name 'fsharp'
      version '4.0'
      description 'F#: a mature, open source, cross-platform, functional-first programming language which empowers users and organizations to tackle complex computing problems with simple, maintainable and robust code.'
      source_url 'https://github.com/fsharp/fsharp/archive/fsharp4.zip'
      source_sha1 'bc8a71b7495ffa3e8c8adb5f2fc30964073c8bba'
      source_filetype 'zip'
      category Category::PROGRAMMING_LANGUAGES

      depends_on 'mono'

      def compile
        Dir.chdir('fsharp-fsharp4') do
          # hack for mono version check
          execute 'cp', '/bin/true', Path.bin + 'pkg-config'
          args = [
             "--prefix=#{prefix_path}",
             "--with-gacdir=#{get_dependency("mono").lib_path + 'mono' + '4.5'}"
          ]
          execute './autogen.sh', *args
          execute 'make -j 1'
          execute 'rm', Path.bin + 'pkg-config'

        end
      end

      def install
        Dir.chdir('fsharp-fsharp4') do
          execute 'make install'
        end
      end

    end
  end
end

