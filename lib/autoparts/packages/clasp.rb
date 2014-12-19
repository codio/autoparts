module Autoparts
  module Packages
    class Clasp < Package
      name 'clasp'
      version '3.1.1'
      description 'Clasp: an answer set solver for (extended) normal and disjunctive logic programs.'
      category Category::LIBRARIES

      source_url 'http://sourceforge.net/projects/potassco/files/clasp/3.1.1/clasp-3.1.1-x86_64-linux.tar.gz'
      source_sha1 'ded622f8dafb7318f968d75ff34d2d316d581b42'
      source_filetype 'tar.gz'

      def install
        FileUtils.mkdir_p(bin_path)
        Dir.chdir(extracted_archive_path + 'clasp-3.1.1') do
          execute 'cp', 'clasp-3.1.1-x86_64-linux', bin_path + 'clasp'
        end
      end
    end
  end
end
