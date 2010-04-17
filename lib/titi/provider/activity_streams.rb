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

        def has_thingy thingy, *args, &block
          thingy_klass  = ('ActivityStreams::'+thingy.to_s.classify).constantize
          thingy_setter = "#{thingy}="
          p [thingy, thingy_klass, thingy_setter]
          self.send(thingy_setter, thingy_klass.new) unless self.send(thingy)
          self.send(thingy).adapt *args, &block
          self.send(thingy)
        end

        def method_missing meth, *args, &block
          if (meth.to_s =~ /has_(\w+)/) && (self.respond_to?("#{$1}="))
            has_thingy $1, *args, &block
          else
            super
          end
        end
      end

      Feed = Struct.new(
        :entry
        )
      Feed.class_eval do
        include Titi::Adaptor
        include Titi::Provider::ActivityStreams::Common

        def adapt thingys
          self.entry = thingys.map do |thingy|
            thingy.to_activity_stream_entry
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
        :obj,               # object
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

      # ActivityStream object.
      # We can't call them 'Object' (ruby has a class like that already :)
      #   http://activitystrea.ms/spec/1.0/atom-activity-01.html#activityobjectelement
      Obj = Struct.new(
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
      Obj.class_eval do
        include Titi::Adaptor
        include Titi::Provider::ActivityStreams::Common
      end
    end
  end
end
