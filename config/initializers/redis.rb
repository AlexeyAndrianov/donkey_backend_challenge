require 'redis'

REDIS_CONFIG = YAML.unsafe_load( File.open( Rails.root.join("config/redis.yml") ) ).symbolize_keys
dflt = REDIS_CONFIG[:default].symbolize_keys
config = dflt.merge(REDIS_CONFIG[Rails.env.to_sym].symbolize_keys) if REDIS_CONFIG[Rails.env.to_sym]

$redis = Redis.new(config)

# Clearing db in every test run.
$redis.flushdb if Rails.env = "test"
