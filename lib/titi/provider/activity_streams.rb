module Titi::Provider
  module ActivityStreams
    autoload :ActivityStreamsStruct, 'titi/provider/activity_streams/activity_streams_struct'
    autoload :Actor,                 'titi/provider/activity_streams/actor'
    autoload :Author,                'titi/provider/activity_streams/actor'
    autoload :Address,               'titi/provider/activity_streams/address'
    autoload :Entry,                 'titi/provider/activity_streams/entry'
    autoload :Feed,                  'titi/provider/activity_streams/feed'
    autoload :Link,                  'titi/provider/activity_streams/link'
    autoload :Obj,                   'titi/provider/activity_streams/obj'
  end
end
