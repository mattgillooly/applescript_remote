# encoding: UTF-8

require 'rubygems'
require 'bundler'
require 'sinatra'

module ApplescriptRemote
  class Application < Sinatra::Base
    get '/' do
      erb :form
    end

    post '/run' do
      AppleScript.execute(params[:cmd])

      redirect to('/')
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run Application
    end
  end
end
