module Titi::Provider::ActivityStreams
  # ActivityStream object.
  # We can't call them 'Object' (ruby has a class like that already :)
  #   http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityobjectelement
  Obj = ActivityStreamsStruct.new(
    :id,
    :title,
    :content,
    :link_alt,
    :published,
    :updated,
    #
    :author,
    :object_type,                   # video, post, file
    :vevent
    )
  Obj.class_eval do
  end
end
