require 'json'
module Titi::Fetcher
  module Json
    module ClassMethods

      def parse raw_json_str
        begin
          return JSON.load(raw_json_str)
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
