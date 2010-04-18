module Titi::Provider
  module Twitter
    autoload :User,   'titi/provider/twitter/models'
    autoload :Status, 'titi/provider/twitter/models'

    Status.class_eval do
      # @example
      #     <entry>
      #       <title>ciberch: thanks to /Jerry @robdolin , @daveman692, @chrismessina, @apparentlymart and @jsmarr for a very produtive activitystrea.ms session</title>
      #       <content type="html">ciberch: thanks to /Jerry  @robdolin , @daveman692, @chrismessina, @apparentlymart and @jsmarr for a very produtive activitystrea.ms session</content>
      #       <id>tag:twitter.com,2007:http://twitter.com/ciberch/statuses/2396395271</id>
      #       <published>2009-06-30T00:59:54+00:00</published>
      #       <updated>2009-06-30T00:59:54+00:00</updated>
      #       <link type="text/html" rel="alternate" href="http://twitter.com/ciberch/statuses/2396395271"/>
      #       <link type="image/pjpeg" rel="image" href="http://s3.amazonaws.com/twitter_production/profile_images/81481539/180653_normal.jpg"/>
      #       <author>
      #         <name>Monica Keller</name>
      #         <uri>http://www.myspace.com/ciberch</uri>
      #       </author>
      #       <activity:verb>http://activitystrea.ms/schema/1.0/post</activity:verb>
      #       <activity:object>
      #           <id>tag:twitter.com,2007:http://twitter.com/ciberch/statuses/2396395271/object</id>
      #           <title>thanks to /Jerry  @robdolin , @daveman692, @chrismessina, @apparentlymart and @jsmarr for a very produtive activitystrea.ms session</title>
      #           <link type="text/html" rel="alternate" href="http://twitter.com/ciberch/statuses/2396395271"/>
      #           <published>2009-06-30T00:59:54+00:00</published>
      #           <updated>2009-06-30T00:59:54+00:00</updated>
      #           <author>
      #               <name>Monica Keller</name>
      #               <uri>http://www.myspace.com/ciberch</uri>
      #           </author>
      #       </activity:object>
      #     </entry>
      #
      def to_activity_stream_entry
        ActivityStreams::Feed.adapt do |feed|
          feed.has_entry(
            :id        => %Q{tag:twitter.com,2007:http://twitter.com/#{user.screen_name}/statuses/#{id}},
            :title     => text,
            :content   => text,
            :published => created_at,
            :verb      => :post
            ) do |entry|
            entry.has_author user.name, user.url
            entry.has_obj do |activity_obj|
              activity_obj.id        = id
              activity_obj.title     = text
              activity_obj.published = created_at
              activity_obj.updated   = created_at
              activity_obj.author    = entry.author
            end
          end
        end
      end

    end
  end
end
