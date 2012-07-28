ENV['RACK_ENV'] ||= 'development'

$LOAD_PATH << File.dirname(__FILE__) + '/lib'

require 'bundler'
Bundler.require

require 'applescript_remote'

run ApplescriptRemote.app
