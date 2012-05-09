namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    config = YAML.load(File.read(Rails.root + 'config/database.yml'))
    puts "Your #{Rails.env} environment database settings are: #{config[Rails.env]}"
  end
end