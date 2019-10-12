class MoviesController < ApplicationController
   
  #index
  get '/movies' do 
    if session["user_id"]
        @user = current_user
        @movies = @user.movies
        erb :'movies/index'
    else
        redirect '/login'
    end
  end

  #new
  get "/movies/new" do 
    erb :'movies/new'
  end

  #create
  post "/movies" do
    # uses ActiveRecord associations to simultaneously
    # create the new movie and push it into the current_user's
    # collection of movies
    user = current_user
    @movie = user.movies.build(params)
    
    # triggers ActiveRecord validations on .save
    # returns boolean to indicate whether or not passed 
    # validations and saved successfully
    if @movie.save
        redirect "/movies"
    else
        erb :"/movies/new"
    end
end

#show
get '/movies/:id' do
    @movie = Movie.find_by_id(params[:id])

    if @movie
        erb :'movies/show'
    else
        redirect "/movies"
    end
end

 #edit
 get "/movies/:id/edit" do 
    movie_user = Movie.find_by_id(params[:id]).user
     if movie_user.id == current_user.id
        @users = User.all
        @movie = Movie.find_by_id(params[:id])
        erb :'movies/edit'
    else 
        flash[:err] = "You aren't authorized to edit the selected movie."
        redirect "/movies"
    end
end

 #update
 patch "/movies/:id" do 
    movie_user = Movie.find_by_id(params[:id]).user
    if movie_user.id == current_user.id
        @movie = Movie.find_by_id(params[:id])
        params.delete("_method")
        if @movie.update(title: params[:title], category: params[:category], rating: params[:rating], my_rating: params[:my_rating])
            redirect "/movies/#{@movie.id}"
        else
            redirect "/movies/#{@movie.id}/edit"
        end
    else
        flash[:err] = "You aren't authorized to update the selected movie."
        erb :"/movies"
    end
end
  
  #show_all
  get '/movies/all' do 
      if logged_in?
          @movies = Movie.all
          erb :'movies/index'
      else
          redirect '/signup'
      end
  end

  #delete
  delete '/movies/:id' do
      movie_user = Movie.find_by_id(params[:id]).user
      if movie_user.id == current_user.id
          Movie.destroy(params[:id])
          redirect :'/movies'
      else
          flash[:err] = "You aren't authorized to delete the selected movie."
          redirect :'/movies'
      end
  end
end