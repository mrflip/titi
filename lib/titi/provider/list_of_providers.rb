# Thank to "Cliqset":http://feedproxy.cliqset.com/feed/selection and Rob Dolin:
PROVIDERS = {
  # Feeds from http://feedproxy.cliqset.com/feed/selection
  :social           => %w[ AvatarsUnited   Bebo            Brightkite      Friendster      FriendFeed      GamerDna        Gather          Hi5             Hyves           Identica
                           Jaiku           Multiply        Netlog          Plurk           Raptr           Skyrock         Twitter                                                                              ],
  :blogging         => %w[ Ameba           Baidu           Blogger         CustomFeed      Douban          LiveJournal     Posterous       Tumblr          WordPress       Xanga                                   ],
  :bookmarking      => %w[ Delicious       Digg            Diigo           GoogleReader    Hatena          Meneame         Mixx            Newsvine        Propeller       Reddit          StumbleUpon     Twine   ],
  :music            => %w[ BlipFm          Buzznet         Ilike           LastFm          Pandora         Zooomr                                                                                                  ],
  :video            => %w[ TwelveSeconds   BlipTv          Cinchcast       DailyMotion     FunnyOrDie      Hulu            Joost           MetaCafe        Qik             Revver          Vimeo           YouTube ],
  :photos           => %w[ DeviantArt      Flickr          Fotolog         MobyPicture     Photobucket     Picasa          Photocase       SlideShare      Smotri          SmugMug         VisualizeUs             ],
  :reviews          => %w[ Blippr          Corkd           Flixster        Goodreads       LibraryThing    Qype            Readernaut      Yelp                                                                    ],

  # # Not yet implemented -- want to help?
  #
  # :more_text_status   => %w[ AIM             WlMessenger                                                 ],
  # :more_location      => %w[ Gowalla         Foursquare      Tripit          UrbanSpoon            Whirl ],
  # :more_gaming        => %w[ Zynga           Playdom         MsgrGames                                   ],
  # :more_social        => %w[ Facebook        LinkedIn        Xing            Plaxo                       ],
  # :more_music         => %w[ Zune                                                                        ],
  # :more_video         => %w[ BuddyTv                                                                     ],
  # :more_photos        => %w[ MetroFlog       WlSkyDrive                                                  ],
  # :more_blogging      => %w[ TypePad         MySpace         MoveableType    WlSpaces                    ],
}

# # # Cliqset uses straight-lowercased names, not underscored. We've gone underscored. Dunno which to choose
# # #
# # :SocialNetworking       => %w[ avatarsunited bebo brightkite friendster friendfeed gamerdna gather hi5 hyves identica jaiku multiply netlog plurk raptr skyrock twitter ],
# # :Blogging               => %w[ ameba baidu blogger customfeed douban livejournal posterous tumblr wordpress xanga],
# # :BookmarkingNews        => %w[ delicious digg diigo googlereader hatena meneame mixx newsvine propeller reddit stumbleupon twine ],
# # :MusicVideosPhotosFiles => %w[ 12seconds blipfm bliptv buzznet cinchcast dailymotion deviantart flickr fotolog funnyordie hulu ilike joost lastfm metacafe mobypicture pandora photobucket photocase picasa qik revver slideshare smotri smugmug visualizeus vimeo youtube zooomr ],
# # :ReviewsRating          => %w[ blippr corkd flixster goodreads librarything qype readernaut yelp ],
