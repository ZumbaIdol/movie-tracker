class SessionsController < ApplicationController

# login
  get '/login' do
  erb :'sessions/login'
end

# put in session
post '/sessions' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/movies'
  else
      redirect '/login'
  end
end

# logout
get '/logout' do
  session.destroy
  redirect '/'
  end
end