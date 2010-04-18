module Titi
  module Fetcher
    autoload :Json,     'titi/fetcher/json'
    autoload :CrackXml, 'titi/fetcher/crack_xml'
    module ClassMethods

      # fetch the given url over the web and parse its contents
      def parse_from_get *args
        parse RestClient.get(*args).to_s
      end

      # load the given filename and parse its contents
      def parse_from_file filename
        parse File.open(filename)
      end

    end
    # Standard hack to add class methods
    def self.included(base) base.class_eval{ extend  ClassMethods } ; end
  end
end
