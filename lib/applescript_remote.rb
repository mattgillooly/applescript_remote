# encoding: UTF-8

require 'rubygems'
require 'bundler'
require 'sinatra'

module ApplescriptRemote
  class Application < Sinatra::Base
    get '/' do
      @last_result = session[:last_result]
      session[:last_result] = nil

      erb :form
    end

    post '/run' do
      result = AppleScript.execute(params[:cmd])
      session[:last_result] = result

      puts "Got result: #{result}"

      redirect to('/')
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run Application
    end
  end
end
