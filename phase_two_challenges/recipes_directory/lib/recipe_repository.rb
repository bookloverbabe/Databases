# EXAMPLE
# Table name: recipes

# Repository class
# (in lib/recipe_repository.rb)

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students;
  
    # Returns an array of recipe objects.
    # `name`, `cooking_time `rating`
    recipes = []
    sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end
    return recipes
  end
  
  # Gets a single record by its ID
  # One argument: the id (number)
  def find(rating)
  # Executes the SQL query:
    sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE rating = $1;' # Set id here to $1, $1 is the placeholder for a parameter in SQL query.
    # Returns a single Student object.
    sql_params = [rating]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]
    
    recipe = Recipe.new
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.cooking_time = record['cooking_time']
    recipe.rating = record['rating']
        
    return recipe
  end
end
