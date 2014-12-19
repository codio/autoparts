module Autoparts
  module Packages
    class ZeroMQ < Package
      name 'zeromq'
      version '4.0.5'
      description 'ZeroMQ: A high-performance asynchronous messaging library'
      category Category::LIBRARIES
      source_url 'http://download.zeromq.org/zeromq-4.0.5.tar.gz'
      source_sha1 'a664ec63661a848ef46114029156a0a6006feecd'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--exec-prefix=#{prefix_path}",
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
