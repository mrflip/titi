module Titi::Provider::ActivityStreams
  Feed = ActivityStreamsStruct.new(
    :entry
    )
  Feed.class_eval do
    include Titi::Serialize::ActivityStreams
    def entries
      [entry].flatten
    end

  end
end
