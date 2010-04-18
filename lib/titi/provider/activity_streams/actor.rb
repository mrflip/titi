module Titi::Provider::ActivityStreams
  # ActivityStream author
  #  http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityactor
  Actor = ActivityStreamsStruct.new(
    :name,
    :uri
    )
  Actor.class_eval do
  end
  Author = Actor
end
