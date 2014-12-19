module Autoparts
  module Packages
    class Racket < Package
      name 'racket'
      version '6.1.1'
      description 'Racket: a full-spectrum programming language. It goes beyond Lisp and Scheme with dialects that support objects, types, laziness, and more.'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://mirror.racket-lang.org/installers/6.1.1/racket-6.1.1-src.tgz'
      source_sha1 'be04ed6e444fbb412e48e06a62da3a9eba993b44'
      source_filetype 'tgz'

      def compile
        Dir.chdir(name_with_version + '/src') do
          args = [
            "--prefix=#{prefix_path}",
          ]
          execute './configure', *args
          execute 'make'
        end
      end


      def install
        Dir.chdir(name_with_version + '/src') do
          execute 'make install'
        end
      end
    end
  end
end
