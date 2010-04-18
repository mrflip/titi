require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
include CompareToStandardExample

describe "Titi" do
  describe "Providers" do
    describe "Twitter" do
      it "generates correct xml" do
        activity_stream = activity_stream_from_file Titi::Provider::Twitter::Status, 'twitter/twitter-api_user_timeline-raw_json.json'
        activity_stream.to_xml.should == standard_example_contents('twitter/twitter-api_user_timeline-activity_streams.xml')
      end
    end
  end
end
