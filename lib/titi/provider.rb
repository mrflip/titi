module Titi
  module Provider
    autoload :ActivityStreams, 'titi/provider/activity_streams'
    #
    autoload :Twitter     , 'titi/provider/twitter'
    autoload :GenericFeed , 'titi/provider/generic_feed'

    # autoload :Gowalla   , 'titi/provider/gowalla'
    # autoload :Foursquare, 'titi/provider/foursquare'
    # autoload :Tripit    , 'titi/provider/tripit'
    # autoload :Facebook  , 'titi/provider/facebook'
    # autoload :Myspace   , 'titi/provider/myspace'
    # autoload :LinkedIn  , 'titi/provider/linked_in'
    # autoload :Digg      , 'titi/provider/digg'
    # autoload :Last_fm   , 'titi/provider/last_fm'
    # autoload :Flickr    , 'titi/provider/flickr'
    # autoload :WordPress , 'titi/provider/word_press'
  end
end
