environment ENV.fetch("RAILS_ENV") { "production" }
app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
workers 2
preload_app!

daemonize
pidfile "/app/pids/puma.pid"
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true

plugin :tmp_restart


