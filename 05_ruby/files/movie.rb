require 'pry'
# We open up an instance of the File class
  # movie_db.txt is the file we opened
  # We opened it in read only mode (starting at the beginning of the file)
f = File.open "movie_db.txt", "r"

# We store an array of every line in the file
all_lines = f.readlines
p all_lines

def add_movie
  puts "Time to add a movie!"
  print "What is the name of it? "
  name = gets.chomp

  print "How long is it? "
  duration = gets.chomp

  print "What is the rating? "
  rating = gets.chomp

  f = File.open "movie_db.txt", "a+"
  f.puts "#{name},#{duration},#{rating}"
  f.close
end

def display_movie( movie )
  movie.chomp!
  movie_details = movie.split ","

  movie_name = movie_details[0]
  movie_duration = movie_details[1]
  movie_rating = movie_details[2]

  puts ""
  puts "Name: #{movie_name}"
  puts "Duration: #{movie_duration}"
  puts "Rating: #{movie_rating}"
end

all_lines.each do |line|
  display_movie( line )
end

add_movie

# display_movie( all_lines[0] )
# display_movie( all_lines[1] )
# display_movie( all_lines[2] )


# Ruby can only open up connections to 1000 files or databases at a time, so we always need to close the files
f.close
