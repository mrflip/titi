module Titi

  module Provider
    #
    module ActivityStreams
      module Common
        def published= date_time
          self[:published] = DateTime.parse(date_time) rescue nil
        end
        def updated= date_time
          self[:updated] = DateTime.parse(date_time) rescue nil
        end
      end

      # An ActivityStream entry
      #   http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityentries
      Entry = Struct.new(
        :id,                # ???
        :title,             # title
        :content,           # content
        :link,              # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}
        :published,         # date published
        :updated,           # date updated
        #
        :category,          # type of entry
        :verb,              # action it implies
        :sync,              # sync
        :rank,              # rank
        #
        :actor,             # actor
        :author,            # author           {"name"=>["misterflip"], "uri"=>["http://profile.myspace.com/index.cfm?fuseaction=user.viewprofile&friendid=24601"]}
        :mood,              #
        :source,
        :object,            # object
        :target             # target
        )
      Entry.class_eval do
        include Titi::Adaptor
      end

      # ActivityStream author
      #  http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityactor
      Actor = Struct.new(
        :name,
        :uri
        )
      Actor.class_eval{ include Titi::Adaptor }
      Author = Actor

      # ActivityStream object
      #   http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityobjectelement
      ActivityObject = Struct.new(
        :id,
        :title,
        :content,
        :link,
        :published,
        :updated,
        #
        :author,
        :object_type,
        :vevent
        )
      ActivityObject.class_eval{ include Titi::Adaptor }
    end
  end
end
