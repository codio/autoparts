# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class Leiningen < Package
      name 'leiningen'
      version '2.5.0'
      description 'Leiningen: A build automation and dependency management tool for Clojure'
      category Category::PROGRAMMING_LANGUAGES

      source_url 'https://github.com/technomancy/leiningen/releases/download/2.5.0/leiningen-2.5.0-standalone.jar'
      source_sha1 '7514d137f0f4ff226c0171df47a3422b1ecfa80a'
      source_filetype 'jar'

      def install
        prefix_path.mkpath
        execute 'mv', archive_filename, prefix_path

        puts "=> Downloading the lein script..."
        download 'https://raw.github.com/technomancy/leiningen/2.5.0/bin/lein-pkg', tmp_lein_script_path, '70853aaf12735e6b468f42e0a119f9991c73cfe6'

        bin_path.mkpath
        execute 'mv', tmp_lein_script_path, lein_executable_path
        execute 'chmod', '0755', lein_executable_path
      end

      def post_install
        execute 'sed', '-i', "s|^LEIN_JAR=.*\.jar|LEIN_JAR=#{prefix_path}/leiningen-#{version}.jar|g", lein_executable_path
      end

      def tmp_lein_script_path
        Path.tmp + "lein-pkg"
      end

      def lein_executable_path
        bin_path + "lein"
      end
    end
  end
end
