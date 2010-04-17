module Titi::Provider
  module Twitter

    #
    #
    # {
    #   "id"                                => 1554031,
    #   "screen_name"                       => "mrflip",
    #   "protected"                         => false,
    #   "followers_count"                   => 1060,
    #   "friends_count"                     => 754,
    #   "statuses_count"                    => 1744,
    #   "favourites_count"                  => 98,
    #   "created_at"                        => "Mon Mar 19 21:08:24 +0000 2007",
    #   #
    #   "name"                              => "Philip Flip Kromer",
    #   "url"                               => "http://infochimps.org",
    #   "location"                          => "iPhone: 30.316122,-97.733817",
    #   "description"                       => "Founder, http://infochimps.org - Building tools to Organize, Explore and Comprehend massive data sources",
    #   "time_zone"                         => "Central Time (US & Canada)",
    #   "utc_offset"                        => -21600,
    #   "lang"                              => "en",
    #   #
    #   "profile_background_color"          => "BCC0C8",
    #   "profile_text_color"                => "000000",
    #   "profile_link_color"                => "0000ff",
    #   "profile_sidebar_border_color"      => "f0edd8",
    #   "profile_sidebar_fill_color"        => "ffffff",
    #   "profile_background_tile"           => false,
    #   "profile_background_image_url"      => "http://a3.twimg.com/profile_background_images/2348065/2005Mar-AustinTypeTour-075_-_Rappers_Delight_Raindrop.jpg",
    #   "profile_image_url"                 => "http://a3.twimg.com/profile_images/377919497/FlipCircle-2009-900-trans_normal.png",
    #   #
    #   "geo_enabled"                       => true,
    #   "contributors_enabled"              => false,
    #   "following"                         => nil,
    #   "notifications"                     => nil,
    #   "verified"                          => false,
    #   #
    #   "status"                            => #<Twitter::Status>
    # }
    #
    User = Struct.new(
      :id,
      :screen_name, :protected, :followers_count, :friends_count, :statuses_count, :favourites_count, :created_at,
      :name, :url, :location, :description, :time_zone, :utc_offset,
      :profile_background_color, :profile_text_color, :profile_link_color,
      :profile_sidebar_border_color, :profile_sidebar_fill_color,
      :profile_background_tile, :profile_background_image_url, :profile_image_url
      )
    User.class_eval do
      include Titi::Provider
      include Titi::Adaptor
      # def status= new_status
      #   new_status = Twitter::Status.from_hash(new_status) unless new_status.is_a?(Twitter::Status)
      #   self[:status] = new_status
      # end

      def created_at= date_time
        unless date_time.is_a?(DateTime)
          dt = DateTime.parse(date_time) rescue nil
        end
        self[:created_at] = dt
      end
    end

    # {
    #   "id"                              => 12327261220,
    #   "created_at"                      => "Sat Apr 17 05:47:28 +0000 2010",
    #   "user"                            => #<Twitter::User>
    #   "text"                            => "Hacking Activity Streams yay",
    #   "favorited"                       => false,
    #   "truncated"                       => false,
    #   "in_reply_to_user_id"             => nil,
    #   "in_reply_to_status_id"           => nil
    #   "in_reply_to_screen_name"         => nil,
    #   "source"                          => "<a href='http://www.atebits.com/' rel='nofollow'>Tweetie</a>",
    # }
    Status =  Struct.new(
      :id,
      :created_at,
      :user,
      :favorited,
      :truncated,
      :in_reply_to_user_id,
      :in_reply_to_status_id,
      :text,
      :source,
      :in_reply_to_screen_name
      )
    Status.class_eval do
      include Titi::Provider
      include Titi::Adaptor

      # virtual setter for user: If argument is not a Twitter::User, adapt it to
      # be a user (assuming it is a hash or a hash_like.
      def user= new_user
        new_user  = Twitter::User.adapt(new_user.to_hash) unless new_user.is_a?(Twitter::User)
        self[:user] = new_user
      end


      # Call the twitter API and fetch tweet with given ID
      #
      # @example
      #   tweet = Status.get(12233609555)
      #   tweet.text
      #   #=> "THANK GOODNESS THE LIBRARY OF CONGRESS HAS UNDERSTOOD THE IMPORTANCE OF MY TWEETS what do you mean others are getting in too"
      #
      def self.get status_id
        raw_json_str = RestClient.get "http://twitter.com/statuses/show/#{status_id}.json"
        raw_status = JSON.load(raw_json_str.to_s)
        adapt(raw_status)
      end
    end
  end
end
