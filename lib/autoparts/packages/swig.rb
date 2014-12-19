# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Swig < Package
      name 'swig'
      version '3.0.2'
      description 'Swig: An interface compiler that connects programs written in C and C++ with scripting languages such as Perl, Python, Ruby, and Tcl.'
      category Category::DEVELOPMENT_TOOLS

      source_url 'http://sourceforge.net/projects/swig/files/swig/swig-3.0.2/swig-3.0.2.tar.gz'
      source_sha1 'e695a14acf39b25f3ea2d7303e23e39dfe284e31'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir(name_with_version) do
          execute './configure', "--prefix=#{prefix_path}", "--disable-dependency-tracking"
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

