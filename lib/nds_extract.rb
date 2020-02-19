# Provided, don't edit
require 'directors_database'

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
  index = 0
  new_movie_collection = []
    while index < movies_collection.length do
      name = movie_with_director_name(name, movies_collection[index])
      new_movie_collection.push(name)
      index += 1
    end

  new_array = []
  counter = 0
    while counter < new_movie_collection.length do 
      new_array.push(new_movie_collection[counter])
      counter += 1
  end 
  puts new_array
end


def gross_per_studio(collection)
  index = 0 
  list_of_studios = []
  result = {}

    while index < collection.length do
      if is_unique(list_of_studios, collection[index][:studio])
        list_of_studios.push(collection[index][:studio])
      end
      index += 1
    end 

    index = 0 
    while index < list_of_studios.length do 
      counter = 0
      studio_gross = 0
      while counter < collection.length do
        if list_of_studios[index] == collection[counter][:studio]
          studio_gross += collection[counter][:worldwide_gross]
        end
        result[collection][counter][:studio] = studio_gross
        counter += 1
      end
      index += 1 
    end 
    result
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
