require 'cucumber'
require 'httparty'
require 'rspec'
require 'pry'
require 'net_http_ssl_fix'
require 'openssl'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# configuracao cucumber
CUCUMBER_PUBLISH_ENABLED=true

$profile = ENV['PROFILE']
CONFIG = YAML.load_file(File.join(Dir.pwd, "/features/support/config/api.yml"))
$api = CONFIG