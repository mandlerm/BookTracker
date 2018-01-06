class CategoriesController < ApplicationController

  def show
    @category = current_user.books.where(category_id: params[:id])
  end


end
