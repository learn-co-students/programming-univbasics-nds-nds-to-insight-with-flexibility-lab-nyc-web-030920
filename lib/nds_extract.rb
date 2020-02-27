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


################### Your code after this point

def movies_with_director_key(name, movies_collection)
  index = 0 

  while index < movies_collection.length do 
    movies_collection[index][:director_name] = name
    index += 1
  end 

  movies_collection
end 

def gross_per_studio(collection)
  index = 0 
  studio_list = []
  studio_hash = {}
  studio_gross = ""


  while index < collection.length do
    studio_list.push(collection[index][:studio])
    index += 1
  end

  index = 0 
  while index < studio_list.length do 
    studio_hash[studio_list[index]] = 0

    counter = 0
    while counter < collection.length do 
      if collection[counter][:studio] == studio_list[index]
        studio_hash[studio_list[index]] += collection[counter][:worldwide_gross]
      end 
      counter += 1
    end 
    index += 1
  end 

 studio_hash

end 

def movies_with_directors_set(test_data)
  array = []
  index = 0

  while index < test_data.length do 
    counter = 0

    while counter < test_data[index][:movies].length do
      test_data[index][:movies][counter][:director_name] = test_data[index][:name]
      counter += 1
    end 

    index += 1
  end 

  index = 0

  while index < test_data.length do 
    counter = 0
    while counter < test_data[index][:movies].length do
      array.push([test_data[index][:movies][counter]])
      counter += 1
    end 
    index += 1
  end 

  array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
