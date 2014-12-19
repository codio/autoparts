module Autoparts
  module Packages
    class Libpcap < Package
      name 'libpcap'
      version '1.6.2'
      description 'Libpcap: provides a portable framework for low-level network monitoring. Applications include network statistics collection, security monitoring, network debugging, etc.'
      category Category::UTILITIES

      source_url 'http://www.tcpdump.org/release/libpcap-1.6.2.tar.gz'
      source_sha1 '7efc7d56f4959de8bb33a92de2e15d92105eac32'
      source_filetype 'tar.gz'

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
