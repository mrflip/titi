module Titi
  module ParseTree
    #
    # construct the downstream part of a hash matcher
    #
    def self.build_match_hash spec_hash
      hsh = { }
      spec_hash.each do |attr, spec|
        hsh[attr] = build_parse_tree(spec)
      end
      hsh
    end

    #
    # recursively build a tree of matchers
    #
    def self.build_parse_tree spec
      case spec
      when nil            then nil
      when Matcher        then spec
      when Hash           then MatchHash.new(build_match_hash(spec))
      when Array          then
        return nil if spec.empty?
        raise "Array spec must be a single selector or a selector and another match specification" unless (spec.length <= 2)
        MatchArray.new(spec[0].to_s, build_parse_tree(spec[1]))
      when String         then MatchFirstElement.new(spec)
      when Proc           then MatchProc.new(nil, spec)
      when Regexp         then MatchRegexp.new(nil, spec, nil, :capture => 1)
      when Symbol         then MatchAttribute.new(nil, spec, nil)
      else raise "Don't know how to parse #{spec.inspect}"
      end
    end
  end
end
