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
    flash[:success] = "Recipe successfully created!"
    redirect_to "/recipes/#{recipe.id}"
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
    flash[:success] = "Recipe successfully updated!"
    redirect_to "/recipes/#{recipe.id}"
  end

  def destroy
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.destroy
    flash[:warning] = "Recipe successfully deleted!"
    redirect_to "/recipes"
  end


end
