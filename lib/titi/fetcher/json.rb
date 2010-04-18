module Titi::Fetcher
  module Json
    module ClassMethods
      # Call the twitter API and fetch tweet with given ID
      #
      # @example
      #   tweet = Status.get(12233609555)
      #   tweet.text
      #   #=> "THANK GOODNESS THE LIBRARY OF CONGRESS HAS UNDERSTOOD THE IMPORTANCE OF MY TWEETS what do you mean others are getting in too"
      #
      def get url
        raw_json_str = RestClient.get url
        begin
          return JSON.load(raw_json_str.to_s)
        rescue StandardError => e
          warn e
          return { }
        end
      end
    end
    # Standard hack to add class methods
    def self.included(base) base.class_eval{ extend ClassMethods } ; end
  end
end
