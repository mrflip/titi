module Titi
  module Adaptor
    # for each key in hsh, sets that attribute to the corresponding value.
    #
    # @example
    #    foo
    #    # => #<Struct Simian name="Mojo Jojo" status="villain" nemesis=nil species='Chimpanzee'>
    #    foo.attributes = { :nemesis => 'Powerpuff girls', :species => 'Pan Troglodytes' }
    #    foo
    #    # => #<Struct Simian name="Mojo Jojo" status="villain" nemesis='Powerpuff Girls' species='Pan Troglodytes'>
    def attributes= hsh
      hsh.each do |attr, val|
        setter = "#{attr}="
        self.send(setter, val) if respond_to?(setter)
      end
    end

    # Adopt attributes from given hash, and programatically-set attributes from block
    #
    # @example
    #     ActivityStreams::Entry.adapt(
    #       :id        => %Q{tag:twitter.com,2007:http://twitter.com/#{user.screen_name}/statuses/#{id}},
    #       :title     => text,
    #       :content   => text,
    #       :published => created_at,
    #       :verb      => :post
    #       ) do |entry|
    #       entry.has_author user.name, user.url
    #       entry.has_obj do |activity_obj|
    #         activity_obj.id        = id
    #         activity_obj.title     = text
    #         activity_obj.published = created_at
    #         activity_obj.updated   = created_at
    #         activity_obj.author    = entry.author
    #       end
    #     end
    def adapt *args, &block
      hsh = args.extract_options!
      args_hsh = Hash.zip(self.members[0...args.length], args)
      self.attributes = hsh.merge(args_hsh)
      yield self if block
    end

    # The standard hack to construct class methods on a class that #include's this model
    module ClassMethods
      # created an object and then adopts from the given hash and block
      def adapt *args, &block
        hsh = args.extract_options!
        obj = self.new *args
        obj.adapt(hsh, &block)
        obj
      end
    end

    def self.included base
      base.class_eval do
        extend Titi::Adaptor::ClassMethods
      end
    end
  end
end
