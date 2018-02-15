class CategoriesController < ApplicationController

  def show
    @category = current_user.books.where(category_id: params[:id]).distinct
    respond_to do |f|
      f.html
      f.json {render json: @category}
    end
  end


end
