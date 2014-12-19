module Autoparts
  module Packages
    class Openldap < Package
      name 'openldap'
      version '2.4.40'
      description 'OpenLDAP:  an open source implementation of the Lightweight Directory Access Protocol.'
      source_url 'ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-2.4.40.tgz'
      source_sha1 '0cfac3b024b99de2e2456cc7254481b6644e0b96'
      source_filetype 'tgz'
      category Category::UTILITIES

      depends_on 'berkeley_db'

      def compile
        Dir.chdir(extracted_archive_path + name_with_version) do
          args = [
            "--prefix=#{prefix_path}",
            "--enable-ldap",
            "--with-tls=openssl"
          ]

          execute './configure', *args
          execute 'make'
        end
      end


      def install
        Dir.chdir(extracted_archive_path + name_with_version) do
          execute 'make install'
        end\
      end
    end
  end
end
