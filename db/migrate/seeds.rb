# user1 = User.create(:name => "Jiminy Cricket", :email => "jiminy@mail.com", :password => "abc123")
# user1.movie.create(:title => "Spaceballs", :category => "Comedy", :rating => "PG")
# user2 = User.create(:name => "Peter Pan", :email => "ppan@mail.com", :password => "123abc")
# user2.movie.create(:title => "So I Married an Axe Murderer", :category => "Comedy/Horror", :rating => "PG-13")

user_list = [
  ["Jiminy Cricket", "jiminy@mail.com"],
  ["Peter Pan", "ppan@mail.com"]
]

movie_list = [
  ["Spaceballs", "Comedy", "PG"],
  ["So I Married an Axe Murderer", "Comedy/Horror", "PG-13"]
]

user_list.each do |name, email|
  User.create( name: name, email: email )

movie_list.each do |title, category, rating|
  Movie.create( title: title, category: category, rating: rating )
  end
end

# User.create("Jiminy Cricket", "jiminy@mail.com", "abc123")
# User.create("Peter Pan", "ppan@mail.com", "123abc")
# Movie.create("Spaceballs", "Comedy", "PG")
# Movie.create("So I Married an Axe Murderer", "Comedy/Horror", "PG-13")