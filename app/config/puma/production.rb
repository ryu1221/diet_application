threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
workers 2 
preload_app!
# port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "production" }
plugin :tmp_restart

app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"

daemonize true
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true




before_fork do
  PumaWorkerKiller.config do |config|
    config.ram           = 1024 
    config.frequency     = 5 * 60 
    config.percent_usage = 0.9 
    
    config.rolling_restart_frequency = 24 * 3600 
    config.reaper_status_logs = true
  end
  PumaWorkerKiller.start
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end