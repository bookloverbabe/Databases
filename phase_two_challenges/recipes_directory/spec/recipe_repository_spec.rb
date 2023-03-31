require 'recipe_directory'

RSpec.describe RecipeRepository do
def reset_recipes_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dname: 'students', user: 'postgres', password: ENV['DATABASE_PASSWORD']})
  connection.exec(seed_sql)
end

before(:each) do
  reset_recipes_table
end

it "returns one recipe " do
  repo = RecipeRepository.new
  recipes = repo.all

  expect(recipes.id).to eq('id')
  expect(recipes.name).to eq('name')
  expect(recipes.cooking_time).to eq ('cooking time')
  expect(recipes.rating).to eq('rating')
end
# Return a single recipes with the find method
it 'returns a single recipes that matches the find parameters' do
  repo = RecipeRepository.new

  recipes = repo.find(5) # The album repository class calls the find method. Using an id number to test the find methodrspec

  expect(recipes.id).to eq(5)
  expect(recipes.name).to eq('name')
  expect(recipes.cooking_time).to eq ('cooking time')
  expect(recipes.rating).to eq('rating')
end
end