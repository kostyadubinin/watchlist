workers Integer(ENV.fetch("WEB_CONCURRENCY", 3))
threads_count = Integer(ENV.fetch("MAX_THREADS", 5))
threads(threads_count, threads_count)

preload_app!

port ENV.fetch("PORT", 3000)
environment ENV.fetch("RACK_ENV", "development")

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
