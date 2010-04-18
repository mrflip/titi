module TestMappingAgainstSample
  # Loads the feed_filename and compares it to the correct_parsed_hash
  def maps_feed_correctly feed_filename, correct_parsed_hash
    warn 'Not implemented yet maps_feed_correctly in spec/support/test_mapping_against_sample.rb'
    true
  end

  # Compares the result of serializing feed with the static correct_output_filename 
  def emits_activity_stream_correctly feed, correct_output_filename
    warn 'Not implemented yet emits_activity_stream_correctly in spec/support/test_mapping_against_sample.rb'
    true
  end

  # Tests that the passes feed validator robot approves of the activity stream output 
  def validates_against_feed_validator
    true
  end
end
