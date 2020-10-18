environment ENV.fetch("RAILS_ENV") { "production" }

app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
pidfile "#{app_root}/tmp/pids/puma.pid"

threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
workers ENV.fetch("WEB_CONCURRENCY") { 2 }
preload_app!

daemonize true
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true

plugin :tmp_restart

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