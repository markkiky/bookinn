require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.redis = { db: 2, url: "redis://127.0.0.1:6379/" }
  schedule_file = "config/schedule.yml"
  if File.exists?(schedule_file)
    Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  end
  Sidekiq::Status.configure_server_middleware config, expiration: 30.minutes
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
end
Sidekiq.configure_client do |config|
  config.redis = { db: 2, url: "redis://127.0.0.1:6379/" }
  Sidekiq::Status.configure_client_middleware config, expiration: 30.minutes
end
