# Thank to "Cliqset":http://feedproxy.cliqset.com/feed/selection and Rob Dolin:
PROVIDERS = {
  # Feeds from http://feedproxy.cliqset.com/feed/selection
  # it uses straight-lowercased names, not underscored. We've gone underscored. Dunno which to choose
  :social           => %w[ AvatarsUnited   Bebo            Brightkite      Friendster      Friendfeed      GamerDna        Gather          Hi5             Hyves           Identica
                           Jaiku           Multiply        Netlog          Plurk           Raptr           Skyrock         Twitter                                                                              ],
  :blogging         => %w[ Ameba           Baidu           Blogger         Douban          Livejournal     Posterous       Tumblr          Wordpress       Xanga                                   ],
  :bookmarking      => %w[ Delicious       Digg            Diigo           GoogleReader    Hatena          Meneame         Mixx            Newsvine        Propeller       Reddit          Stumbleupon     Twine   ],
  :music            => %w[ Blipfm          Buzznet         Ilike           Lastfm          Pandora         Zooomr                                                                                                  ],
  :video            => %w[ TwelveSeconds   Bliptv          Cinchcast       DailyMotion     FunnyOrDie      Hulu            Joost           Metacafe        Qik             Revver          Vimeo           Youtube ],
  :photos           => %w[ DeviantArt      Flickr          Fotolog         MobyPicture     Photobucket     Picasa          Photocase       Slideshare      Smotri          Smugmug         Visualizeus             ],
  :reviews          => %w[ Blippr          Corkd           Flixster        Goodreads       Librarything    Qype            Readernaut      Yelp                                                                    ],

  :activity_streams => %w[ Gowalla         Myspace]

  # # Not yet implemented, need example mappings -- want to help?
  # :more_text_status   => %w[ AIM                             WlMessenger            ],
  # :more_location      => %w[ Foursquare      Tripit          UrbanSpoon       Whirl ],
  # :more_gaming        => %w[ Zynga           Playdom         MsgrGames              ],
  # :more_social        => %w[ Facebook        LinkedIn        Plaxo            Xing  ],
  # :more_music         => %w[ Zune                                                   ],
  # :more_video         => %w[ BuddyTv                                                ],
  # :more_photos        => %w[ MetroFlog                       WlSkyDrive             ],
  # :more_blogging      => %w[ TypePad         MoveableType    WlSpaces               ],
}

FEEDPROXY_FEEDS = [
  # %w[ customfeed              weblogs                posted      ],
  #
  %w[ tweleveseconds          videos                 posted      ],
  %w[ ameba                   weblogs                posted      ],
  %w[ avatarsunited           weblogs                posted      ],
  %w[ baidu                   weblogs                posted      ],
  %w[ bebo                    weblogs                posted      ],
  %w[ blipfm                  songs                  posted      ],
  %w[ blippr                  reviews                posted      ],
  %w[ bliptv                  videos                 posted      ],
  %w[ blogger                 weblogs                posted      ],
  %w[ brightkite              activity               posted      ],
  %w[ buzznet                 weblogs                posted      ],
  %w[ buzznet                 photos                 posted      ],
  %w[ buzznet                 videos                 posted      ],
  %w[ cinchcast               media                  posted      ],
  %w[ corkd                   reviews                posted      ],
  %w[ dailymotion             videos                 posted      ],
  %w[ delicious               bookmarks              posted      ],
  %w[ deviantart              weblogs                posted      ],
  %w[ deviantart              photos                 posted      ],
  %w[ deviantart              photos                 favorited   ],
  %w[ digg                    bookmarks              dugg        ],
  %w[ digg                    bookmarks              favorited   ],
  %w[ digg                    bookmarks              posted      ],
  %w[ digg                    images                 dugg        ],
  %w[ digg                    images                 favorited   ],
  %w[ digg                    images                 posted      ],
  %w[ digg                    videos                 dugg        ],
  %w[ digg                    videos                 favorited   ],
  %w[ digg                    videos                 posted      ],
  %w[ diigo                   bookmarks              posted      ],
  %w[ douban                  weblogs                posted      ],
  %w[ flickr                  media                  posted      ],
  %w[ flickr                  media                  favorited   ],
  %w[ flixster                reviews                posted      ],
  %w[ fotolog                 photos                 posted      ],
  %w[ fotolog                 photos                 favorited   ],
  %w[ friendfeed              activity               posted      ],
  %w[ friendster              weblogs                posted      ],
  %w[ funnyordie              videos                 posted      ],
  %w[ funnyordie              videos                 favorited   ],
  %w[ gamerdna                notes                  posted      ],
  %w[ gather                  weblogs                posted      ],
  %w[ goodreads               reviews                posted      ],
  %w[ googlereader            bookmarks              posted      ],
  %w[ hatena                  bookmarks              posted      ],
  %w[ hatena                  bookmarks              favorited   ],
  %w[ hi5                     weblogs                posted      ],
  %w[ hulu                    activity               posted      ],
  %w[ hyves                   media                  posted      ],
  %w[ hyves                   weblogs                posted      ],
  %w[ identica                notes                  posted      ],
  %w[ ilike                   songs                  played      ],
  %w[ ilike                   songs                  favorited   ],
  %w[ jaiku                   notes                  posted      ],
  %w[ joost                   activity               posted      ],
  %w[ joost                   videos                 favorited   ],
  %w[ lastfm                  songs                  played      ],
  %w[ lastfm                  songs                  favorited   ],
  %w[ lastfm                  weblogs                posted      ],
  %w[ librarything            reviews                posted      ],
  %w[ livejournal             weblogs                posted      ],
  %w[ meneame                 bookmarks              posted      ],
  %w[ meneame                 bookmarks              favorited   ],
  %w[ metacafe                videos                 posted      ],
  %w[ mixx                    bookmarks              posted      ],
  %w[ mobypicture             media                  posted      ],
  %w[ multiply                activity               posted      ],
  %w[ netlog                  photos                 posted      ],
  %w[ netlog                  weblogs                posted      ],
  %w[ newsvine                bookmarks              posted      ],
  %w[ pandora                 songs                  favorited   ],
  %w[ photobucket             media                  posted      ],
  %w[ photocase               photos                 posted      ],
  %w[ picasa                  photos                 posted      ],
  %w[ plurk                   notes                  posted      ],
  %w[ posterous               weblogs                posted      ],
  %w[ propeller               bookmarks              posted      ],
  %w[ propeller               bookmarks              favorited   ],
  %w[ qik                     videos                 posted      ],
  %w[ qype                    reviews                posted      ],
  %w[ raptr                   notes                  posted      ],
  %w[ readernaut              activity               posted      ],
  %w[ readernaut              books                  read        ],
  %w[ reddit                  bookmarks              posted      ],
  %w[ revver                  videos                 posted      ],
  %w[ skyrock                 weblogs                posted      ],
  %w[ slideshare              files                  posted      ],
  %w[ slideshare              files                  favorited   ],
  %w[ smotri                  videos                 posted      ],
  %w[ smugmug                 photos                 posted      ],
  %w[ smugmug                 videos                 posted      ],
  %w[ stumbleupon             weblogs                posted      ],
  %w[ stumbleupon             bookmarks              favorited   ],
  %w[ tumblr                  weblogs                posted      ],
  %w[ twine                   twine                  created     ],
  %w[ twine                   bookmarks              posted      ],
  %w[ twitter                 notes                  posted      ],
  %w[ twitter                 notes                  favorited   ],
  %w[ vimeo                   videos                 posted      ],
  %w[ vimeo                   videos                 favorited   ],
  %w[ visualizeus             photos                 favorited   ],
  %w[ wordpress               weblogs                posted      ],
  %w[ xanga                   weblogs                posted      ],
  %w[ yelp                    reviews                posted      ],
  %w[ youtube                 videos                 posted      ],
  %w[ youtube                 videos                 favorited   ],
  %w[ zooomr                  photos                 posted      ],
]

# load './lib/titi/provider/list_of_providers.rb' ; pr = PROVIDERS.values.flatten.map(&:underscore).to_set ; ff = FEEDPROXY_FEEDS.map{|provider, obj, verb| provider }.uniq.sort.to_set
# p (ff - pr).sort ; p (pr - ff).sort
