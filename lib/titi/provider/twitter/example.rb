require 'restclient'
require 'json'
require 'titi'
require 'wukong'

# require 'titi/provider/twitter'

# Dir['./**/*.rb'].each{|req| load req }^
# $raw_json_str = RestClient.get 'http://twitter.com/users/show/mrflip.json'
$raw_json_str = %q{{"created_at":"Mon Mar 19 21:08:24 +0000 2007","profile_sidebar_fill_color":"ffffff","description":"Founder, http://infochimps.org - Building tools to Organize, Explore and Comprehend massive data sources","verified":false,"time_zone":"Central Time (US & Canada)","status":{"in_reply_to_status_id":null,"created_at":"Sat Apr 17 05:47:28 +0000 2010","favorited":false,"in_reply_to_user_id":null,"source":"<a href=\"http://www.atebits.com/\" rel=\"nofollow\">Tweetie</a>","id":12327261220,"in_reply_to_screen_name":null,"truncated":false,"text":"Hacking Activity Streams yay"},"following":null,"profile_sidebar_border_color":"f0edd8","url":"http://infochimps.org","profile_image_url":"http://a3.twimg.com/profile_images/377919497/FlipCircle-2009-900-trans_normal.png","notifications":null,"followers_count":1061,"profile_background_color":"BCC0C8","location":"iPhone: 30.316122,-97.733817","screen_name":"mrflip","profile_background_image_url":"http://a3.twimg.com/profile_background_images/2348065/2005Mar-AustinTypeTour-075_-_Rappers_Delight_Raindrop.jpg","friends_count":754,"statuses_count":1744,"profile_text_color":"000000","protected":false,"profile_background_tile":false,"favourites_count":98,"name":"Philip Flip Kromer","contributors_enabled":false,"profile_link_color":"0000ff","id":1554031,"lang":"en","geo_enabled":true,"utc_offset":-21600}}
$raw_user     = JSON.load($raw_json_str.to_s)
$user         = Titi::Provider::Twitter::User.from_hash $raw_user
