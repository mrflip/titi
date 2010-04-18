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

      # Call the twitter API and fetch tweet with given ID
      #
      # @example
      #   tweet = Status.get(12233609555)
      #   tweet.text
      #   #=> "THANK GOODNESS THE LIBRARY OF CONGRESS HAS UNDERSTOOD THE IMPORTANCE OF MY TWEETS what do you mean others are getting in too"
      #
      def get url
        parse RestClient.get(url).to_s
      end

      def from_file filename
        parse File.open(filename)
      end
    end
    # Standard hack to add class methods
    def self.included(base) base.class_eval{ extend ClassMethods } ; end
  end
end
