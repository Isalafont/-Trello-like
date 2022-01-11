# frozen_string_literal: true

redis_url = ENV['REDIS_URL'] || 'redis://redis:6379'

Redis.current = Redis.new(url:  ENV['redis_url'],
                          port: ENV['REDIS_PORT'],
                          db:   ENV['REDIS_DB'])