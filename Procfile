web: bundle exec puma -t 2:2 -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -c 1 -q default