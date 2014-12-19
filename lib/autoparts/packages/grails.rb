module Autoparts
  module Packages
    class Grails < Package
      name 'grails'
      version '2.4.4'
      description 'Grails: an Open Source, full stack, web application framework for the JVM.'
      source_url 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.4.4.zip'
      source_sha1 'db2285d4a803b976753f28f5cb38c5a66c711600'
      source_filetype 'zip'
      category Category::DEVELOPMENT_TOOLS

      depends_on 'groovy'

      def install
        prefix_path.mkpath
        Dir.chdir(extracted_archive_path + name_with_version) do
          execute 'cp', '-r', '.', prefix_path
        end
        Dir.glob(prefix_path.to_s + '/bin/*.bat').each { |f| File.delete(f) }
      end

	  def required_env
        env_file.unlink if env_file.exist?
        [
          'export JAVA_HOME="/usr"',
          "export GRAILS_HOME='#{prefix_path}'"
        ]
      end        
        
        
      def env_file
        Path.env + 'grails'
      end

      def post_install
        env_file.unlink if env_file.exist?
      end

      def tips
        <<-EOS.unindent

         Close and open terminal to have grails working after the install.

         Or run:
          . ~/.bash_profile
        EOS
      end
    end
  end
end

