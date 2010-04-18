require 'crack'
module Titi::Fetcher
  module CrackXml
    module ClassMethods

      def parse raw_xml_str
        begin
          return Crack::XML.parse(raw_xml_str)
        rescue StandardError => e
          warn e
          return { }
        end
      end

    end
    # Standard hack to add class methods and other modules
    def self.included(base) base.class_eval{ include Titi::Fetcher ; extend ClassMethods } ; end
  end
end
