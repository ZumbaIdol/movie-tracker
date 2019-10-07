class UsersController < ApplicationController

  get '/signup' do 
      erb :'users/new'
  end

  post '/users/new' do 
      @user = User.new(params)

      if @user.save
          session[:user_id] = @user.id
          redirect "/movies/show"
      else
          erb  :"/users/new"
      end

  end
end