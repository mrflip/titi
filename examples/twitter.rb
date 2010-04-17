#!/usr/bin/env ruby
require 'rubygems'
require 'restclient'
require 'json'
require 'active_support'

TITI_DIR = File.dirname(File.expand_path(__FILE__+'/..')) unless defined?(TITI_DIR)
$: << TITI_DIR+'/lib' unless $:.include?(TITI_DIR+'/lib')

require 'titi'
require 'titi/provider/twitter'
include Titi::Provider

tweet = Twitter::Status.get(12233609555)
entry = tweet.to_activity_stream_entry

p tweet.to_hash
puts entry.to_xml
