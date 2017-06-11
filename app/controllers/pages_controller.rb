class PagesController < ApplicationController
  # GET request for /# which is home page
  def home
    @basic_plan = Plan.find(1).name
    @pro_plan = Plan.find(2).name
  end
  
  def about
  end
end