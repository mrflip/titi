module Titi::Serialize
  module ActivityStreams
    # Location of the .erb file for rendering pretty activity streams XML
    ACTIVITY_STREAMS_TEMPLATE = File.join(File.dirname(__FILE__)+'/activity_streams/feed.xml.erb')

    def self.activity_streams_template
      @activity_streams_template ||= File.read(ACTIVITY_STREAMS_TEMPLATE)
    end

    def self.serializer
      @serializer ||= Erubis::Eruby.new(activity_streams_template)
    end

    def to_xml
      Titi::Serialize::ActivityStreams.serializer.result(:feed => self)
    end
  end
end
