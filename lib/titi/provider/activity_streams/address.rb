module Titi::Provider::ActivityStreams
  Address = ActivityStreamsStruct.new(
    :country,
    :locality,
    :postalCode,
    #
    :xml_keys          # for debugging, capture the keys from the raw XML hash
    )
  Address.class_eval do
  end
end
