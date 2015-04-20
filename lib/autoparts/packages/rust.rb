# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Rust < Package
      name 'rust'
      version '1.0.0-beta2'
      description 'Rust: A safe, concurrent, practical language'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'http://static.rust-lang.org/dist/rust-1.0.0-beta.2-x86_64-unknown-linux-gnu.tar.gz'
      source_sha1 'd5e0ff6e0f95a3f56c78d4a645a191566c0b143c'
      source_filetype 'tar.gz'

      def install
        Dir.chdir('rust-1.0.0-beta.2-x86_64-unknown-linux-gnu') do
          execute './install.sh', "--prefix=#{prefix_path}"
        end
      end
    end
  end
end
