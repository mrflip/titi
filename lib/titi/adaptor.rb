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

    # The standard hack to construct class methods on a class that #include's this model
    module ClassMethods
      # Construct a new one of these from some other one of those.
      #
      # @example
      # ActivityStreams::Entry.adapt(
      #   :id        => status.id,
      #   :title     => status.text,
      #   :content   => status.text,
      #   :verb      => :post
      #   ) do |entry|
      #   status_time     = Time.parse(status.created_at) rescue nil
      #   entry.published = status_time
      #   entry.author    = ActivityStreams::Author.new(:name => status.user.name, :url => status.user.url)
      #   entry.object    = ActivityStreams::Object.adapt do |activity_obj|
      #     activity_obj.id        = status.id
      #     activity_obj.title     = status.text
      #     activity_obj.published = status_time
      #     activity_obj.updated   = status_time
      #     activity_obj.author    = ActivityStreams::Author.new(:name => status.user.name, :url => status.user.url)
      #   end
      # end

      def adapt hsh={}, &block
        obj            = self.new
        obj.attributes = hsh
        yield  obj if block
        return obj
      end
    end
    def self.included base
      base.class_eval do
        extend Titi::Adaptor::ClassMethods
      end
    end
  end
end
