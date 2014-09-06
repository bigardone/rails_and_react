class HomeController < ApplicationController
  def index
    @people = Person.sorted
  end
end
