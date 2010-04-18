module Titi::Provider::ActivityStreams
  class ActivityStreamsStruct < Struct
    include Titi::Adaptor

    # Merge given attributes into the hash
    def attributes= hsh
      conv_hsh = {}
      hsh.each do |k,v|
        k = k.to_s.gsub(/:/,'_') if k =~ /:/
        conv_hsh[k] = v
      end
      super hsh
    end

    # expand to hash, and expand all hash values to hash
    def to_hash *args
      hsh = super(*args)
      hsh.each do |attr, val|
        hsh[attr] = val.to_hash if val.respond_to?(:to_hash)
      end
      hsh
    end

    # def to_xml *args
    #   hsh = self.to_hash
    #   hsh.to_xml :root => self.class.to_s.underscore.gsub(%r{.*/},'')
    # end

    # Use method_missing to dispatch the has_[whatever] setters
    def method_missing meth, *args, &block
      if (meth.to_s =~ /has_(\w+)/) && (self.respond_to?("#{$1}="))
        has_thingy $1, *args, &block
      else
        super
      end
    end

    def has_thingy thingy, *args, &block
      thingy_klass  = ('ActivityStreams::'+thingy.to_s.camelize).constantize
      thingy_setter = "#{thingy}="
      self.send(thingy_setter, thingy_klass.new) unless self.send(thingy)
      self.send(thingy).adapt *args, &block
      self.send(thingy)
    end
  end
end
