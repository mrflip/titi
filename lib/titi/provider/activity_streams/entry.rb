module Titi::Provider::ActivityStreams

  # An ActivityStream entry
  #   http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityentries
  Entry = ActivityStreamsStruct.new(
    :id,                # ???
    :title,             # title
    :content,           # content
    :link_alt,          # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}
    :link_enclosure,    # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}
    :link_preview,      # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}
    :link_icon,         # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}
    :link_related,      # link             {"href"=>"http://x.myspacecdn.com/modules/common/static/img/photo.gif", "rel"=>"icon", "type"=>"image/gif"}

    :published,         # date published
    :updated,           # date updated
    #
    :category,          # type of entry
    :activity_verb,     # action it implies:
    :sync,              # sync
    :rank,              # rank
    #
    :actor,             # actor
    :author,            # author           {"name"=>["misterflip"], "uri"=>["http://profile.myspace.com/index.cfm?fuseaction=user.viewprofile&friendid=24601"]}
    :mood,              #
    :source,
    :obj,               # object
    :target             # target
    )
  Entry.class_eval do
    def published= date_time
      self[:published] = DateTime.parse(date_time) rescue nil
    end
    def updated= date_time
      self[:updated] = DateTime.parse(date_time) rescue nil
    end
  end
end
