module Autoparts
  module Packages
    class Protobuf < Package
      name 'protobuf'
      version '2.6.0'
      description 'Protocol Buffers: language and platform-neutral mechanism for serializing structured data'
      source_url 'https://protobuf.googlecode.com/svn/rc/protobuf-2.6.0.tar.gz'
      source_sha1 'ab00a2c85d73ab718dd37595b2ae1a8f530dc26e'
      source_filetype 'tar.bz2'
      category Category::LIBRARIES

      def install
        Dir.chdir('protobuf-2.6.0') do
          execute 'make', 'install'
        end
      end

      def compile
        Dir.chdir('protobuf-2.6.0') do
          args = ["--prefix=#{prefix_path}"]
          execute './configure', *args
          execute 'make'
        end
      end
    end
  end
end
