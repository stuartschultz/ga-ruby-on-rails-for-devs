namespace :db do
  desc "Display database configuration."
  task :config => [ :environment ] do
    environment = Rails.env
    config = YAML.load(File.open(Rails.root + 'config/database.yml'))
    puts "Your #{environment} environment database settings are: #{config[environment]}"
  end
end