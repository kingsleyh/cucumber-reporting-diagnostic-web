require 'rubygems'
require 'sinatra'
require 'fileutils'
require File.dirname(__FILE__) + '/cucumber_reporting.rb'

 set :views, settings.root + '/templates'
 set :public_folder, settings.root + '/public'
 $base = "/cucumber-reporting-web"
 # $base = ""

get '/' do
  @releases = Dir.entries(settings.root + '/public/releases').collect{|version| version if version.match(/jar$/)}.compact
  erb :index
end

post '/generate' do
  begin   
  release_version = params[:diagnostic][:release]
  json = params[:diagnostic][:json]
  flash = params[:diagnostic][:flash].nil?
  skipped = params[:diagnostic][:skipped].nil?
  undefined = params[:diagnostic][:undefined].nil?

  salt = random
  FileUtils.mkdir_p settings.root + "/public/json/#{salt}"
  json_path = settings.root + "/public/json/#{salt}/report.json"
  f = File.new(json_path,"w")
  f.puts json
  f.close
  json_location = "#{salt}/report.json"
  output_location = salt
  CucumberReporting.new(release_version,json_location,output_location,flash,skipped,undefined)
  redirect "#{$base}/cucumber-html-reports/#{salt}/feature-overview.html"
  rescue => error
    @error = error.backtrace
    erb :error
  end
end

def random
  Time.now.to_i + rand(100000)
end

