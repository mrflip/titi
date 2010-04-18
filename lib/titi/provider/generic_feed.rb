module Titi::Provider
  module GenericRss

    class Feed
      attr_accessor :rss
      def initialize rss
        self.rss = rss
      end

      def get_via_feedzirra url

      end

      def get_via_restclient_crack url
        rss_xml = RestClient.get(url) ;
        raw_feed = Crack::XML.parse(rss_xml.to_s) ; rss = raw_feed['rss'].to_mash
      end

      def self.get url
        new Feedzirra::Feed.fetch_and_parse(url)
      end

      def entry
        rss.entries.first
      end

      def to_activity_stream_entry
        ActivityStreams::Entry.adapt(
          :activity_verb => :post,
          :id            => entry.entry_id,
          :title         => entry.title,
          :content       => entry.summary,
          :summary       => entry.summary,
          :published     => entry.published,
          :link_
          ) do |entry|
          entry.has_author user.name, user.url
          entry.has_obj do |activity_obj|
            activity_obj.id        = id
            activity_obj.title     = text
            activity_obj.published = created_at
            activity_obj.updated   = created_at
            activity_obj.author    = entry.author
          end
        end

      end
    end
  end
end
