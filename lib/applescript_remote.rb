# encoding: UTF-8

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'rack-flash'

require 'applescript_remote/command'
require 'applescript_remote/web'

require "data_mapper"
DataMapper.setup(:default, "sqlite3::memory:")

module ApplescriptRemote

  Command.auto_migrate!

  def self.execute(cmd)
    c = Command.new(cmd)
    result = c.execute
    c.save!

    result
  end

  def self.app
    @app ||= Rack::Builder.new do
      run Web
    end
  end

end
