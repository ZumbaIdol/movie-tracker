Movie Tracker

A Sinatra based application for keeping track of your favorite movies. 🎞

About

I have an extensive collection of movies that I've purchased over the years.  

I. LOVE. MOVIES. ESPECIALLY. ONES. WITH. SUPERHEROES.

I wanted to build something that I cared about and could actually put to use:

Thus, the Movie Tracker sinatra app!

Installation
Fork the repository
Clone the files to your computer
Run bundle install
Run rake db:migrate
Run shotgun to start the server

Enabling Sessions
To enable sessions, create a .env file in the root directory.

In .env add the following, replacing the string secret with a secret word or string.

SESSION_SECRET="secret"

Commit .gitignore

Note: Since the .env file contains sensitive information, it should not be tracked, committed or push to Github. Please see this post on https://shannoncrabill.com/blog/hiding-sensitive-information-with-environmental-variables-in-ruby/ for more information.

