class UsersController < ApplicationController 

  def index 
    matching_plans = Plan.all

    @list_of_plans = matching_plans

    render({ :template => "home/users.html.erb"})
  end 

  def details 
   ## need to fill this in so that the user_details page prints the user's username and the associated plans. 
    username = params.fetch("username")

    @matching_usernames = Plan.where({ :username => username })

    @the_username = @matching_usernames.at(0)

    render({ :template => "home/user_details.html.erb"})
  end 

  def activities 
    matching_plans = Plan.all

    @list_of_plans = matching_plans

    render({ :template => "home/activities.html.erb"})
  end 
end 
