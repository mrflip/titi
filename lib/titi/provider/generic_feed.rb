require 'sax-machine'
module Titi::Provider
  module GenericFeed

    class AtomLink
      element :link,      :as => :url,        :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      
    end
    
    class AtomEntry
      include SAXMachine
      element :title
      element :link,      :as => :url,        :value => :href, :with => {:type => "text/html", :rel => "alternate"}
      element :name,      :as => :author
      element :content
      element :summary
      element :published
      element :id,        :as => :entry_id
      element :created,   :as => :published
      element :issued,    :as => :published
      element :updated
      element :modified,  :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link,     :as => :link_alt,   :value => :href, :with => {:type => "text/html", :rel => "alternate"}
    end

    class AtomFeed
      include Titi::Fetcher
      include SAXMachine
      element :title
      element :link,      :as => :url,        :value => :href, :with => {:type => "text/html"}
      element :link,      :as => :feed_url,   :value => :href, :with => {:type => "application/atom+xml"}
      elements :entry,    :as => :entries,    :class => AtomEntry

      def to_activity_stream
        ActivityStreams::Entry.adapt({ 
            :activity_verb => :post,
            :id            => entry.entry_id,
            :title         => entry.title,
            :published     => entry.published,
            :summary       => entry.summary,
            # :links         => entry.links,
          }) do |feed_entry|
          # feed_entry.has_author    item['dc:creator'], channel['link']
          # feed_entry.has_obj do |activity_obj|
          #   activity_obj.id        = id
          #   activity_obj.title     = text
          #   activity_obj.published = created_at
          #   activity_obj.updated   = created_at
          #   activity_obj.author    = item.author
          # end
        end
      end
    end

    # # :channel  => {
    # #   :title, :description, :atom_link, :link,
    # #   :item => [ { :guid, :title, :description, :pubDate, :author, :category, :dc_creator, :comments, :link, :source } ]
    # # }
    # class FeedzirraFeed
    #   include Titi::Fetcher::Feedzirra
    #   attr_accessor :rss
    #   def initialize rss
    #     self.rss = rss
    #   end
    # 
    #   def self.parse *args
    #     new super(*args).to_mash.first.last
    #   end
    # 
    #   def channel
    #     rss['channel'] 
    #   end
    # 
    #   def entry
    #     rss.entries.first
    #   end
    # 
    #   def to_activity_stream
    #     ActivityStreams::Entry.adapt({ 
    #         :activity_verb => :post,
    #         :id            => entry.entry_id,
    #         :title         => entry.title,
    #         :published     => entry.published,
    #         :summary       => entry.summary,
    #         :link_alt      => entry.links
    #       }) do |feed_entry|
    #       feed_entry.has_author    item['dc:creator'], channel['link']
    #       # feed_entry.has_obj do |activity_obj|
    #       #   activity_obj.id        = id
    #       #   activity_obj.title     = text
    #       #   activity_obj.published = created_at
    #       #   activity_obj.updated   = created_at
    #       #   activity_obj.author    = item.author
    #       # end
    #     end
    #   end
    # end

    # :channel  => {
    #   :title, :description, :atom_link, :link,
    #   :item => [ { :guid, :title, :description, :pubDate, :author, :category, :dc_creator, :comments, :link, :source } ]
    # }
    class RssXml
      include Titi::Fetcher::CrackXml
      
      attr_accessor :rss
      def initialize rss
        self.rss = rss
      end

      def self.parse *args
        new super(*args).to_mash.first.last
      end

      def channel
        rss['channel'] 
      end

      def item
        channel['item'].first
      end

      def to_activity_stream
        ActivityStreams::Entry.adapt({ 
            :activity_verb => :post,
            :id            => item['guid'],
            :title         => item['title'],
            :published     => item['pubDate'],
            :summary       => item['description'],
            :link_alt      => item['link']
          }) do |entry|
          entry.has_author    item['dc:creator'], channel['link']
          # entry.has_obj do |activity_obj|
          #   activity_obj.id        = id
          #   activity_obj.title     = text
          #   activity_obj.published = created_at
          #   activity_obj.updated   = created_at
          #   activity_obj.author    = item.author
          # end
        end

      end
    end
  end
end
