# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Tig < Package
      name 'tig'
      version '2.0.3'
      description 'Tig: An ncurses-based text-mode interface for git'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://jonas.nitro.dk/tig/releases/tig-2.0.3.tar.gz'
      source_sha1 '762dff87ea8691b7c1b5cfdaf077e367c60ef375'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--sysconfdir=#{Path.etc}"
          ]
          execute './configure', *args
        end
      end

      def install
        Dir.chdir(name_with_version) do
          bin_path.mkpath
          execute 'make install'
        end
      end
    end
  end
end
