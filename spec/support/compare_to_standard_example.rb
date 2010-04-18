module CompareToStandardExample
  STANDARD_EXAMPLE_DIR = File.expand_path(File.dirname(__FILE__) + '/../data/provider')

  def standard_example filename
    File.join(STANDARD_EXAMPLE_DIR, filename)
  end

  # TODO: custom matcher
  def standard_example_contents filename
    File.read(standard_example(filename))
  end

  def activity_stream_from_file klass, filename
    feed = klass.from_file standard_example(filename)
    feed.to_activity_stream
  end
end
