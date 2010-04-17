module Titi

  module Provider
    #
    module ActivityStreams
      # Some methods common to all ActivityStreams classes
      module Common
        def to_hash *args
          hsh = super(*args)
          hsh.each do |attr, val|
            hsh[attr] = val.to_hash if val.respond_to?(:to_hash)
          end
          hsh
        end

        def to_xml *args
          hsh = self.to_hash
          hsh.to_xml :root => self.class.to_s.underscore.gsub(%r{.*/},'')
        end
      end

      Feed = Struct.new(
        :entry
        )
      Feed.class_eval do
        include Titi::Adaptor
        include Titi::Provider::ActivityStreams::Common

        def adapt objs
          self.entry = objs.map do |obj|
            obj.to_activity_stream_entry
          end
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
        include Titi::Provider::ActivityStreams::Common
        def published= date_time
          self[:published] = DateTime.parse(date_time) rescue nil
        end
        def updated= date_time
          self[:updated] = DateTime.parse(date_time) rescue nil
        end
      end

      # ActivityStream author
      #  http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityactor
      Actor = Struct.new(
        :name,
        :uri
        )
      Actor.class_eval do
        include Titi::Adaptor
        include Titi::Provider::ActivityStreams::Common
      end
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
      ActivityObject.class_eval do
        include Titi::Adaptor
        include Titi::Provider::ActivityStreams::Common
      end
    end
  end
end
