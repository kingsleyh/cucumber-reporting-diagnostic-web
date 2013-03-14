Warbler::Config.new do |config|
  # Application directories to be included in the webapp.
  config.dirs = %w(config public src templates vendor)

  # Additional files/directories to include, above those in config.dirs
  config.includes = FileList["config.ru"]

  # Name of the war file (without the .war) -- defaults to the basename
  # of RAILS_ROOT
  config.jar_name = "cucumber-reporting-web"

  # Application booter to use, one of :rack, :rails, or :merb (autodetected by default)
  # config.webxml.booter = :rack
end