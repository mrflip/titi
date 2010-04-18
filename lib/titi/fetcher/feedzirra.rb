module Titi::Fetcher
  module Feedzirra
    module ClassMethods

      def get url
        begin
          Feedzirra::Feed.fetch_and_parse(url)
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
