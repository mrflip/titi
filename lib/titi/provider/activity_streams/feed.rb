module Titi::Provider::ActivityStreams
  Feed = ActivityStreamsStruct.new(
    :entry
    )
  Feed.class_eval do
    # Location of the .erb file for rendering pretty activity streams XML
    ACTIVITY_STREAMS_TEMPLATE = File.join(File.dirname(__FILE__)+'/activity_streams/feed.xml.erb')

    def entries
      [entry].flatten
    end

    def self.activity_streams_template
      @activity_streams_template ||= File.read(ACTIVITY_STREAMS_TEMPLATE)
    end

    def self.activity_streams_renderer
      @activity_streams_renderer ||= Erubis::Eruby.new(activity_streams_template)
    end

    def to_xml
      self.class.activity_streams_renderer.result(:feed => self)
    end
  end
end
