#!/usr/bin/env ruby
require 'rubygems'
require 'titi' ; include Titi::Provider

status_to_fetch = ARGV.first || 12233609555

$stderr.puts "Fetching status #{status_to_fetch} and converting to activity stream..."
tweet   = Twitter::Status.fetch_status(status_to_fetch)
tw_feed = tweet.to_activity_stream
puts tw_feed.to_xml
