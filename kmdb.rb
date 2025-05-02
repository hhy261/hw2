# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# rails generate model Studio
# rails generate model Movie 
# rails generate model Actor 
# rails generate model Role 

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# Delete existing data
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Create studio
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

# Create movies
bb = Movie.new
bb["title"] = "Batman Begins"
bb["year_released"] = 2005
bb["rated"] = "PG-13"
bb["studio_id"] = warner_bros["id"]
bb.save

dk = Movie.new
dk["title"] = "The Dark Knight"
dk["year_released"] = 2008
dk["rated"] = "PG-13"
dk["studio_id"] = warner_bros["id"]
dk.save

dkr = Movie.new
dkr["title"] = "The Dark Knight Rises"
dkr["year_released"] = 2012
dkr["rated"] = "PG-13"
dkr["studio_id"] = warner_bros["id"]
dkr.save

# Create actors
bale = Actor.new; bale["name"] = "Christian Bale"; bale.save
caine = Actor.new; caine["name"] = "Michael Caine"; caine.save
neeson = Actor.new; neeson["name"] = "Liam Neeson"; neeson.save
holmes = Actor.new; holmes["name"] = "Katie Holmes"; holmes.save
oldman = Actor.new; oldman["name"] = "Gary Oldman"; oldman.save
ledger = Actor.new; ledger["name"] = "Heath Ledger"; ledger.save
eckhart = Actor.new; eckhart["name"] = "Aaron Eckhart"; eckhart.save
gyllenhaal = Actor.new; gyllenhaal["name"] = "Maggie Gyllenhaal"; gyllenhaal.save
hardy = Actor.new; hardy["name"] = "Tom Hardy"; hardy.save
levitt = Actor.new; levitt["name"] = "Joseph Gordon-Levitt"; levitt.save
hathaway = Actor.new; hathaway["name"] = "Anne Hathaway"; hathaway.save

# Create roles
Role.new(movie_id: bb["id"], actor_id: bale["id"], character_name: "Bruce Wayne").save
Role.new(movie_id: bb["id"], actor_id: caine["id"], character_name: "Alfred").save
Role.new(movie_id: bb["id"], actor_id: neeson["id"], character_name: "Ra's Al Ghul").save
Role.new(movie_id: bb["id"], actor_id: holmes["id"], character_name: "Rachel Dawes").save
Role.new(movie_id: bb["id"], actor_id: oldman["id"], character_name: "Commissioner Gordon").save

Role.new(movie_id: dk["id"], actor_id: bale["id"], character_name: "Bruce Wayne").save
Role.new(movie_id: dk["id"], actor_id: ledger["id"], character_name: "Joker").save
Role.new(movie_id: dk["id"], actor_id: eckhart["id"], character_name: "Harvey Dent").save
Role.new(movie_id: dk["id"], actor_id: caine["id"], character_name: "Alfred").save
Role.new(movie_id: dk["id"], actor_id: gyllenhaal["id"], character_name: "Rachel Dawes").save

Role.new(movie_id: dkr["id"], actor_id: bale["id"], character_name: "Bruce Wayne").save
Role.new(movie_id: dkr["id"], actor_id: oldman["id"], character_name: "Commissioner Gordon").save
Role.new(movie_id: dkr["id"], actor_id: hardy["id"], character_name: "Bane").save
Role.new(movie_id: dkr["id"], actor_id: levitt["id"], character_name: "John Blake").save
Role.new(movie_id: dkr["id"], actor_id: hathaway["id"], character_name: "Selina Kyle").save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movie1 = Movie.all[0]
studio1 = Studio.find_by({"id" => movie1["studio_id"]})
puts "#{movie1["title"]}  #{movie1["year_released"]}  #{movie1["rated"]}  #{studio1["name"]}"

movie2 = Movie.all[1]
studio2 = Studio.find_by({"id" => movie2["studio_id"]})
puts "#{movie2["title"]}  #{movie2["year_released"]}  #{movie2["rated"]}  #{studio2["name"]}"

movie3 = Movie.all[2]
studio3 = Studio.find_by({"id" => movie3["studio_id"]})
puts "#{movie3["title"]}  #{movie3["year_released"]}  #{movie3["rated"]}  #{studio3["name"]}"

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

role1 = Role.all[0]
movie1 = Movie.find_by({"id" => role1["movie_id"]})
actor1 = Actor.find_by({"id" => role1["actor_id"]})
puts "#{movie1["title"]}  #{actor1["name"]}  #{role1["character_name"]}"

role2 = Role.all[1]
movie2 = Movie.find_by({"id" => role2["movie_id"]})
actor2 = Actor.find_by({"id" => role2["actor_id"]})
puts "#{movie2["title"]}  #{actor2["name"]}  #{role2["character_name"]}"

role3 = Role.all[2]
movie3 = Movie.find_by({"id" => role3["movie_id"]})
actor3 = Actor.find_by({"id" => role3["actor_id"]})
puts "#{movie3["title"]}  #{actor3["name"]}  #{role3["character_name"]}"

role4 = Role.all[3]
movie4 = Movie.find_by({"id" => role4["movie_id"]})
actor4 = Actor.find_by({"id" => role4["actor_id"]})
puts "#{movie4["title"]}  #{actor4["name"]}  #{role4["character_name"]}"

role5 = Role.all[4]
movie5 = Movie.find_by({"id" => role5["movie_id"]})
actor5 = Actor.find_by({"id" => role5["actor_id"]})
puts "#{movie5["title"]}  #{actor5["name"]}  #{role5["character_name"]}"

role6 = Role.all[5]
movie6 = Movie.find_by({"id" => role6["movie_id"]})
actor6 = Actor.find_by({"id" => role6["actor_id"]})
puts "#{movie6["title"]}  #{actor6["name"]}  #{role6["character_name"]}"

role7 = Role.all[6]
movie7 = Movie.find_by({"id" => role7["movie_id"]})
actor7 = Actor.find_by({"id" => role7["actor_id"]})
puts "#{movie7["title"]}  #{actor7["name"]}  #{role7["character_name"]}"

role8 = Role.all[7]
movie8 = Movie.find_by({"id" => role8["movie_id"]})
actor8 = Actor.find_by({"id" => role8["actor_id"]})
puts "#{movie8["title"]}  #{actor8["name"]}  #{role8["character_name"]}"

role9 = Role.all[8]
movie9 = Movie.find_by({"id" => role9["movie_id"]})
actor9 = Actor.find_by({"id" => role9["actor_id"]})
puts "#{movie9["title"]}  #{actor9["name"]}  #{role9["character_name"]}"

role10 = Role.all[9]
movie10 = Movie.find_by({"id" => role10["movie_id"]})
actor10 = Actor.find_by({"id" => role10["actor_id"]})
puts "#{movie10["title"]}  #{actor10["name"]}  #{role10["character_name"]}"

role11 = Role.all[10]
movie11 = Movie.find_by({"id" => role11["movie_id"]})
actor11 = Actor.find_by({"id" => role11["actor_id"]})
puts "#{movie11["title"]}  #{actor11["name"]}  #{role11["character_name"]}"

role12 = Role.all[11]
movie12 = Movie.find_by({"id" => role12["movie_id"]})
actor12 = Actor.find_by({"id" => role12["actor_id"]})
puts "#{movie12["title"]}  #{actor12["name"]}  #{role12["character_name"]}"

role13 = Role.all[12]
movie13 = Movie.find_by({"id" => role13["movie_id"]})
actor13 = Actor.find_by({"id" => role13["actor_id"]})
puts "#{movie13["title"]}  #{actor13["name"]}  #{role13["character_name"]}"

role14 = Role.all[13]
movie14 = Movie.find_by({"id" => role14["movie_id"]})
actor14 = Actor.find_by({"id" => role14["actor_id"]})
puts "#{movie14["title"]}  #{actor14["name"]}  #{role14["character_name"]}"

role15 = Role.all[14]
movie15 = Movie.find_by({"id" => role15["movie_id"]})
actor15 = Actor.find_by({"id" => role15["actor_id"]})
puts "#{movie15["title"]}  #{actor15["name"]}  #{role15["character_name"]}"
