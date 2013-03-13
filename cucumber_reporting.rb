include Java
Dir.glob(File.dirname(__FILE__) + '/public/lib/*.jar').each{|jar| require jar}

class CucumberReporting

  def initialize(release_version, json_location,output_location, flash_charts, skipped_fails, undefined_fails)
    path = File.dirname(__FILE__)
    require  "#{path}/public/releases/#{release_version}"
    java_import 'net.masterthought.cucumber.ReportBuilder'
    list = ["#{path}/public/json/#{json_location}"]
    rd = java.io.File.new("#{path}/public/cucumber-html-reports/#{output_location}")
    report_builder = ReportBuilder.new(list, rd, "", "1","diagnostic-report",skipped_fails,undefined_fails,flash_charts,false,false,"")
    report_builder.generateReports
  end

end


