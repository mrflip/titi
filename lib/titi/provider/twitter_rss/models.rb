# require 'feedzirra'
require 'crack'
require 'extlib/mash'
require 'extlib/hash'

module Titi::Provider
  module TwitterRss
    class UserTimeline
      attr_accessor :rss
      def initialize
        # hi darren
        # self.rss = Feedzirra::Feed.fetch_and_parse("http://twitter.com/statuses/user_timeline/dbounds.rss")
        rss_xml = RestClient.get("http://twitter.com/statuses/user_timeline/dbounds.rss")
        self.raw_feed = Crack::XML.parse(rss_xml.to_s)
        self.rss = raw_feed['rss'].to_mash
      end

      def entry
        rss[:channel][:item].first
      end

      def to_activity_stream_entry
        ActivityStreams::Entry.adapt(
          :id        => entry[:guid],
          :published => entry[:pubDate],
          # :updated   => nil,            # implementor decision
          # :title     => text,
          # :content   => text,
          :verb      => :post
          )
        do |entry|
          entry.has_link(:href, :title, :rel, 'text/xhtml')
        #   entry.has_author user.name, user.url
        #   entry.has_obj do |activity_obj|
        #     activity_obj.id        = id
        #     activity_obj.title     = text
        #     activity_obj.published = created_at
        #     activity_obj.updated   = created_at
        #     activity_obj.author    = entry.author
        #   end
        end

      end
    end
  end
end


# retweet => share
# mention, reply => threading extension
