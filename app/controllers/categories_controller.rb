class CategoriesController < ApplicationController
    before_action :set_category, only: [:show]


  private
    def set_category
      @category = Category.find_by(:id => params.require(:id))
    end
end
