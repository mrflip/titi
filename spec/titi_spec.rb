require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
include CompareToStandardExample

def it_generates_correct_activity_stream klass, source_filename, target_filename
  it "generates correct activity stream" do
    activity_stream         = activity_stream_from_file(klass, source_filename)
    activity_stream.to_xml.should == standard_example_contents(target_filename)
  end
end

describe "Titi" do
  describe "Providers" do
    describe "Twitter" do
      it_generates_correct_activity_stream Titi::Provider::Twitter::Status, 'twitter/twitter-api_user_timeline-raw_json.json', 'twitter/twitter-api_user_timeline-activity_streams.xml'
    end

    describe "Generic Atom" do
      it_generates_correct_activity_stream(
        Titi::Provider::GenericFeed::AtomXml,
        'delicious/delicious_bookmarks-raw_feed.xml',
        'twitter/twitter-api_user_timeline-activity_streams.xml' )
    end

  end
end
