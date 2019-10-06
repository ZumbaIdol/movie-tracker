class MoviesController < ApplicationController
   
  #index
  get '/movies' do 
      if logged_in?
          @user = current_user
          @movies = current_user.movies
          
          erb :'movies/index'
      else
          redirect '/signup'
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

  #new
  get "/movies/new" do 
      @users = User.all
      erb :' movies/new'
  end
  
  #edit
  get "/movies/:id/edit" do 
      movie_user = Movie.find_by_id(params[:id]).user
       if movie_user.id == current_user.id
          @movie = Movie.find_by_id(params[:id])
          erb :'movies/edit'
      else 
          flash[:err] = "You aren't authorized to modify the selected movie."
          redirect "/movies"
      end
  end
  
  #update
  patch "/movies/:id" do 
      movie_user = Movie.find_by_id(params[:id]).user
      if movie_user.id == current_user.id
          @movie = Movie.find_by_id(params[:id])
          params.delete("_method")
          if @movie.update(params)
              redirect "/movies/#{@movie.id}"
          else
              redirect "/movies/#{@movie.id}/edit"
          end
      else
          flash[:err] = "You aren't authorized to modify the selected movie."
          erb :"/movies/index"
      end
  end

  #show
  get '/movies/:id' do
      @movie = Movie.find_by_id(params[:id])

      if @movie
          erb :'movies/show'
      else
          redirect "movies"
      end
  end

  #create
  post "/movies" do
      # uses ActiveRecord associations to simultaneously
      # create the new post and push it into the current_user's
      # collection of posts
      @movie = current_user.movies.build(params)
      
      # triggers ActiveRecord validations on .save
      # returns boolean to indicate whether or not passed 
      # validatoins and saved successfully
      if @movie.save
          redirect "/movies"
      else
          erb  :"/movies/new"
      end
  end

  #delete
  delete '/movies/:id' do
      movie_user = Movie.find_by_id(params[:id]).user
      if movie_user.id == current_user.id
          Movie.destroy(params[:id])
          redirect :'/movies'
      else
          flash[:err] = "You aren't authorized to modify the selected movie."
          redirect :'/movies'
      end
  end

end


# GET: /movies
#   get "/movies" do
#     erb :"/movies/index.html"
#   end

#   # GET: /movies/new
#   get "/movies/new" do
#     erb :"/movies/new.html"
#   end

#   # POST: /movies
#   post "/movies" do
#     redirect "/movies"
#   end

#   # GET: /movies/5
#   get "/movies/:id" do
#     erb :"/movies/show.html"
#   end

#   # GET: /movies/5/edit
#   get "/movie_tracke_rs/:id/edit" do
#     erb :"/movies/edit.html"
#   end

#   # PATCH: /movies/5
#   patch "/movies/:id" do
#     redirect "/movies/:id"
#   end

#   # DELETE: /movies/5/delete
#   delete "/movies/:id/delete" do
#     redirect "/movies"
#   end
# end