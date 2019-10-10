require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  post "/signup" do
    redirect '/movies/index'
  end

  post "/sessions/login" do
    erb :'/movies/index'
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end
  end
end