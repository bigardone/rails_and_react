class PeopleController < ApplicationController
  before_filter :search_people

  def index
    render json: @people
  end

  private

  def search_people
    @people =  if params[:search].present?
      Person.search(params[:search])
    else
      Person.all
    end.sorted
  end
end
