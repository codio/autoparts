# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Lua < Package
      name 'lua'
      version '5.2.3'
      description 'Lua: A powerful, fast, lightweight, embeddable scripting language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://www.lua.org/ftp/lua-5.2.3.tar.gz'
      source_sha1 '926b7907bc8d274e063d42804666b40a3f3c124c'
      source_filetype 'tar.gz'

      def compile
        Dir.chdir('lua-5.2.3') do
          execute 'make', 'linux'
        end
      end

      def install
        Dir.chdir('lua-5.2.3') do
          execute 'make', 'install', "INSTALL_TOP=#{prefix_path}", "INSTALL_MAN=#{man_path}/man1"
        end
      end
    end
  end
end
