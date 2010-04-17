module Titi
  module Provider
    autoload :ActivityStreams, 'titi/provider/activity_streams'
    #
    autoload :Twitter   , 'titi/provider/twitter'
    autoload :Gowalla   , 'titi/provider/gowalla'
    autoload :Foursquare, 'titi/provider/foursquare'
    autoload :Tripit    , 'titi/provider/tripit'
    autoload :Facebook  , 'titi/provider/facebook'
    autoload :Myspace   , 'titi/provider/myspace'
    autoload :LinkedIn  , 'titi/provider/linked_in'
    autoload :Digg      , 'titi/provider/digg'
    autoload :Last_fm   , 'titi/provider/last_fm'
    autoload :Flickr    , 'titi/provider/flickr'
    autoload :WordPress , 'titi/provider/word_press'
  end
end

# # from Rob Dolin, a list:
# {
# :text_status => %w[ Twitter         StatusNet       Plurk           AIM             WlMessenger                                            ],
# :location    => %w[ Gowalla         Foursquare      Tripit          Yelp            Qype            UrbanSpoon      Brightkite      Whirl  ],
# :social      => %w[ Facebook        MySpace         LinkedIn        Xing            Plaxo                                                  ],
# :music       => %w[ LastFm          Pandora         Zune            iLike                                                                  ],
# :bookmarking => %w[ Digg            StumbleUpon     Delicious       Facebook                                                               ],
# :video       => %w[ YouTube         DailyMotion     Hulu            BuddyTv         SkyDrive                                               ],
# :gaming      => %w[ Zynga           Playdom         MsgrGames                                                                              ],
# :photos      => %w[ Flickr          Photobucket     MetroFlog       Fotolog         Picasa          WlSkyDrive                             ],
# :blogging    => %w[ Blogger         WordPress       TypePad         MySpace         MoveableType    WlSpaces                               ],
# }
#
# # See also: http://feedproxy.cliqset.com/feed/selection
# {
# Social       => %w[ AvatarsUnited Bebo BrightKite Friendster FriendFeed GamerDNA Gather hi5 Hyves Identica Jaiku Multiply Netlog Plurk Raptr Skyrock Twitter ],
# Blogging     => %w[ Ameba Baidu Blogger CustomFeed Douban LiveJournal Posterous Tumblr WordPress Xanga ],
# Bookmarking  => %w[ Delicious Digg Diigo GoogleReader Hatena Meneame Mixx Newsvine Propeller Reddit StumbleUpon Twine ],
# Media        => %w[ 12seconds BlipFm BlipTv Buzznet Cinchcast Dailymotion DeviantArt Flickr Fotolog FunnyOrDie Hulu iLike Joost LastFm MetaCafe MobyPicture Pandora Photobucket Photocase Picasa Qik Revver SlideShare Smotri SmugMug VisualizeUs Vimeo YouTube Zooomr ],
# Reviews      => %w[ Blippr Corkd Flixster Goodreads LibraryThing Qype Readernaut Yelp  ],
# }
