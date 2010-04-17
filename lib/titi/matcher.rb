module Titi
  module Matcher
    class Base
      attr_accessor :selector
      attr_accessor :matcher
      def initialize selector, matcher=nil
        self.selector = selector
        self.matcher  = matcher
      end
      def match doc
        raise "Abstract class #{self.class}"
      end
    end

    class MatchFirstElement < Base
      # return the inner_html of the given element
      #
      # eg.
      #   m = MatchFirstElement.new('span#bio/a.homepage')
      #   m.match('<span id="bio"><a class="homepage" href="http://foo.bar">My Homepage</a></span>')
      #   # => 'My Homepage'
      #
      def match doc
        el = doc.at(selector) or return nil
        matcher ? matcher.match(el) : el.inner_html
      end
    end

    class MatchArray < Base
      # return the given element
      #
      # eg.
      #   m = MatchAttribute.new('span#bio/a.homepage', 'href')
      #   m.match('<span id="bio"><a class="homepage" href="http://foo.bar">My Homepage</a></span>')
      #   # => 'http://foo.bar'
      #
      def match doc
        subdoc = (doc/selector) or return nil
        if matcher
          subdoc.map{|el| matcher.match(el)}
        else
          subdoc.map{|el| el.inner_html}
        end
      end
    end

    class MatchAttribute < Base
      attr_accessor :attribute
      def initialize selector, attribute, matcher=nil
        super selector, matcher
        self.attribute = attribute.to_s
      end
      # return the given attribute on the first matching path
      #
      # eg.
      #   m = MatchAttribute.new('span#bio/a.homepage', 'href')
      #   m.match('<span id="bio"><a class="homepage" href="http://foo.bar">My Homepage</a></span>')
      #   # => 'http://foo.bar'
      #
      def match doc
        val = doc.path_attr(selector, attribute)
        matcher ? matcher.match(val) : val
      end
    end

    #
    # map html elements -- or any HTMLParser tree -- to attributes in a hash.
    #   HTMLParser.new([ {
    #       :name     => 'li/span.fn',
    #       :location => 'li/span.adr',
    #       :url      => HTMLParser.attr('li/a.url[@href]', 'href'),
    #       :bio      => 'li#bio/span.bio',
    #     }
    #   ])
    #
    class MatchHash
      attr_accessor :match_hash
      def initialize match_hash
        # Kludge? maybe.
        raise "MatchHash requires a hash of :attributes => matchers." unless match_hash.is_a?(Hash)
        self.match_hash = match_hash
      end
      # Returns a hash mapping each attribute in match_hash
      # to the result of its matcher on the current doc tree
      def match doc
        hsh = { }
        match_hash.each do |attr, m|
          val = m.match(doc)
          case attr
          when Array then hsh.merge!(Hash.zip(attr, val).reject{|k,v| v.nil? }) if val
          else            hsh[attr] = val  end
        end
        self.class.scrub!(hsh)
      end
      # kill off keys with nil values
      def self.scrub! hsh
        hsh # .reject{|k,v| v.nil? }
      end
    end

    class MatchProc < MatchFirstElement
      attr_accessor :proc
      attr_accessor :options
      def initialize selector, proc, matcher=nil, options={}
        super selector, matcher
        self.options = options
        self.proc = proc
      end
      def match doc
        val = super doc
        self.proc.call(val) if val
      end
    end

    class MatchRegexp < Base
      attr_accessor :re
      attr_accessor :options
      def initialize selector, re, matcher=nil, options={}
        super selector, matcher
        self.options = options
        self.re = re
      end
      def match doc
        # apply selector, if any
        el = selector ? doc.contents_of(selector) : doc
        m = re.match(el.to_s)
        val = case
        when m.nil? then nil
        when self.options[:one] then m.captures.first
        else m.captures
        end
        # pass to matcher, if any
        matcher ? matcher.match(val) : val
      end
    end

    class MatchRegexpRepeatedly < Base
      attr_accessor :re
      def initialize selector, re, matcher=nil
        super selector, matcher
        self.re = re
      end
      def match doc
        # apply selector, if any
        el = selector ? doc.contents_of(selector) : doc
        return unless el
        # get all matches
        val = el.to_s.scan(re)
        # if there's only one capture group, flatten the array
        val = val.flatten if val.first && val.first.length == 1
        # pass to matcher, if any
        matcher ? matcher.match(val) : val
      end
    end

  end
end
