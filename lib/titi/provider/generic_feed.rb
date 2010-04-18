module Titi::Provider
  module GenericFeed

    class AtomXml
      include Titi::Fetcher::CrackXml
      
      attr_accessor :rss
      def initialize rss
        self.rss = rss
      end

      def parse *args
        super(*args).to_mash['rss']
      end

      def self.from_file filename
        new super(filename)
      end

      def entry
        rss.entries.first
      end

      def to_activity_stream
        ActivityStreams::Entry.adapt({ 
            :activity_verb => :post,
            :id            => entry.entry_id,
            :title         => entry.title,
            :content       => entry.summary,
            :summary       => entry.summary,
            :published     => entry.published
          }) do |entry|
          # entry.has_author user.name, user.url
          # entry.has_obj do |activity_obj|
          #   activity_obj.id        = id
          #   activity_obj.title     = text
          #   activity_obj.published = created_at
          #   activity_obj.updated   = created_at
          #   activity_obj.author    = entry.author
          # end
        end

      end
    end
  end
end
