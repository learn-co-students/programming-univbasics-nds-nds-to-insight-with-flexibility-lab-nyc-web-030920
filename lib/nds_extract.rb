# Provided, don't edit
require 'directors_database'
require 'pry'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.

  
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
index = 0
new_array = []
while index < movies_collection.length
new_array << movie_with_director_name(name, movies_collection[index])
index += 1
end
new_array
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
#   new_array = []
#   index = 0
#   while index < collection.length
#   new_array << collection[index][:studio]
#     index += 1
# end
#   studio_array = new_array.uniq
#   studio_index = 0 
#   studio_key_hash = {}
#   while studio_index < studio_array.length do 
#     studio_key_hash[studio_array[studio_index]] = 0
#     # studio_index += 1
#   # end
#   sum_index = 0 
#     while sum_index < collection.length do 
#       if collection[sum_index][:studio] == studio_array[sum_index]
#         studio_key_hash[studio_array[sum_index]] += collection[sum_index][:worldwide_gross]
#     end
#       sum_index += 1 
#     end
#     studio_index += 1
#   end
#     studio_key_hash
#   # RETURN:
#   #
#   # Hash whose keys are the studio names and whose values are the sum
#   # total of all the worldwide_gross numbers for every movie in the input Hash
movie_total = {}
movie = 0
while movie < collection.length do 
  if !movie_total[collection[movie][:studio]]
    movie_total[collection[movie][:studio]] = collection[movie][:worldwide_gross]
  else 
    movie_total[collection[movie][:studio]] += collection[movie][:worldwide_gross]
  end
  movie += 1
end
movie_total
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  
index = 0 
title_index = 0
new_array = [] 
  while index < source.length do
    while title_index < source[index][:movies].length do 
      # source[index][:name]
      # source[index][:movies][title_index][:title]
      # new_hash = {:title => source[index][:movies][title_index][:title] , 
      # :worldwide_gross=>source[index][:movies][title_index][:worldwide_gross], 
      # :release_year=>source[index][:movies][title_index][:worldwide_gross], 
      # :studio=>source[index][:movies][title_index][:worldwide_gross], 
      # :director_name => source[index][:name]} 
            new_hash = movie_with_director_name(source[index][:name], source[index][:movies][title_index])
      new_array << [new_hash]
      title_index += 1
    end
    title_index = 0
    index += 1
  end
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.

  new_array
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end