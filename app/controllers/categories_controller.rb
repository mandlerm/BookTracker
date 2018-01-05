class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])  #only show book for current user in this category
    binding.pry
  end


end
