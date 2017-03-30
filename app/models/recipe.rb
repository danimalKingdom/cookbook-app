class Recipe < ActiveRecord::Base

  belongs_to :user
  has_many :categorized_recipes

  extend FriendlyId
  friendly_id :title, use: :slugged

  def ingredients_list
    return ingredients.split(",")
  end

  def directions_list
    return directions.split(",")
  end

  def friendly_created_at
    created_at.strftime("%b %e, %l:%M %p")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time%60
    result = ""
    result += "#{hours} hours" if hours >= 1
    result += "#{minutes} minutes" if minutes > 0
    return result
  end
end







