class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all #=> array of recipes
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    recipe = Recipe.create(
      title: params[:title],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image: params[:image],
      prep_time: params[:prep_time])
    render "create.html.erb"
  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "show.html.erb"
  end

  def edit
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
    render "edit.html.erb"
  end

  def update
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.title = params[:title]
    recipe.save
    render "update.html.erb"
  end

  def destroy
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.destroy
    render "destroy.html.erb"
  end


end
