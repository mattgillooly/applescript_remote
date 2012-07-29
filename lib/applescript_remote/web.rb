module ApplescriptRemote

  class Web < Sinatra::Base
    enable :sessions
    use Rack::Flash

    set :haml, :format => :html5
    set :layout, :layout

    get '/' do
      haml :home,
           :locals => {
             :last_result => flash[:notice],
             :commands => Command.all
           }
    end

    post '/run' do
      flash[:notice] = ApplescriptRemote.execute(params[:cmd])
      redirect to('/')
    end
  end

end
