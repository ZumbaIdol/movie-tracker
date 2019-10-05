class MovieTrackeRsController < ApplicationController

  # GET: /movie_tracke_rs
  get "/movie_tracke_rs" do
    erb :"/movie_tracke_rs/index.html"
  end

  # GET: /movie_tracke_rs/new
  get "/movie_tracke_rs/new" do
    erb :"/movie_tracke_rs/new.html"
  end

  # POST: /movie_tracke_rs
  post "/movie_tracke_rs" do
    redirect "/movie_tracke_rs"
  end

  # GET: /movie_tracke_rs/5
  get "/movie_tracke_rs/:id" do
    erb :"/movie_tracke_rs/show.html"
  end

  # GET: /movie_tracke_rs/5/edit
  get "/movie_tracke_rs/:id/edit" do
    erb :"/movie_tracke_rs/edit.html"
  end

  # PATCH: /movie_tracke_rs/5
  patch "/movie_tracke_rs/:id" do
    redirect "/movie_tracke_rs/:id"
  end

  # DELETE: /movie_tracke_rs/5/delete
  delete "/movie_tracke_rs/:id/delete" do
    redirect "/movie_tracke_rs"
  end
end
