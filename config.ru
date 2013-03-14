require 'rubygems'
require 'bundler'

Bundler.require

require File.dirname(__FILE__) + "/src/diagnostic_app.rb"

set :run, false
set :environment, :production

run Sinatra::Application
