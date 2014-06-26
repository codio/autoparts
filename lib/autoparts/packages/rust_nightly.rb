# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Rust < Package
      name 'rust-nightly'
      version '0.11.0-pre-nightly-05ca9f7_2014-06-24'
      description 'Rust: A safe, concurrent, practical language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://static.rust-lang.org/dist/rust-nightly-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 'e20ad572b5266b915ffe0142322c256927f15a4e'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('rust-nightly-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end

    end
  end
end
