# encoding: UTF-8

require 'rubygems'
require 'bundler'
require 'sinatra'
require 'rack-flash'

require 'applescript_remote/command'

module ApplescriptRemote

  def self.execute(cmd)
    Command.new(cmd).execute
  end

  class Web < Sinatra::Base
    enable :sessions
    use Rack::Flash

    get '/' do
      @last_result = flash[:notice]

      erb :form
    end

    post '/run' do
      flash[:notice] = ApplescriptRemote.execute(params[:cmd])

      redirect to('/')
    end
  end

  def self.app
    @app ||= Rack::Builder.new do
      run Web
    end
  end

end
