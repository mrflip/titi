#!/usr/bin/env ruby
require 'rubygems'
TITI_DIR = File.dirname(File.expand_path(__FILE__+'/..')) unless defined?(TITI_DIR)
$: << TITI_DIR+'/lib' unless $:.include?(TITI_DIR+'/lib')

require 'titi'
require 'titi/provider/twitter'
include Titi::Provider

tweet   = Twitter::Status.get(12233609555)
tw_feed = tweet.to_activity_stream_entry
puts tw_feed.to_xml
