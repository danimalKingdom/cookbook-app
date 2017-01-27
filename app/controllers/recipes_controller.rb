class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    if params[:sort] #if a query parameter with the key "sort" exists
      @recipes = Recipe.all.order(params[:sort] => params[:sort_order])
    end
    sort_quick = params[:quick]
    if sort_quick
      @recipes = Recipe.where("prep_time < ?", 60)
    end
  end

  def search
    search_term = params[:search]
    #ping database to find recipes that are similar to search term
    @recipes = Recipe.where("title LIKE ?", "%#{search_term}%")
    render :index
  end

  def new
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
    if recipe_id == "random"
      @recipe = Recipe.all.sample
    end
  end

  def edit
    recipe_id = params[:id] 
    @recipe = Recipe.find_by(id: recipe_id)
  end

  def update
    recipe_id = params[:id]
    recipe = Recipe.find_by(id: recipe_id)
    recipe.update(title: params[:title],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      image: params[:image],
      prep_time: params[:prep_time])
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
