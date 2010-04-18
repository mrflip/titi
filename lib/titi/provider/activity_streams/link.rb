module Titi::Provider::ActivityStreams

  # <link href="http://twitter.com/banksean/statuses/12244282580"
  #    type="text/xhtml" rel="via" title="Just saw a @cliqset #salmon @-mention interop demo by @jpanzer. Very neat stuff!">
  #  </link>

  Link = ActivityStreamsStruct.new(
    :href,
    :title,
    :rel,
    :type
    )
  Link.class_eval do
  end
end
