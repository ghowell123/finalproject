class UsersController < ApplicationController 

  def index 
    matching_plans = Plan.all

    @list_of_plans = matching_plans

    render({ :template => "home/users.html.erb"})
  end 

  def details 
   ## need to fill this in so that the user_details page prints the user's username and the associated plans. 

    render({ :template => "home/user_details.html.erb"})
  end 

end 
