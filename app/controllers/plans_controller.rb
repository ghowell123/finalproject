class PlansController < ApplicationController
  def index
    matching_plans = Plan.all

    @list_of_plans = matching_plans.order({ :created_at => :desc })

    render({ :template => "plans/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_plans = Plan.where({ :id => the_id })

    @the_plan = matching_plans.at(0)

    render({ :template => "plans/show.html.erb" })
  end

  def create
    the_plan = Plan.new
    the_plan.activity = params.fetch("query_activity")
    the_plan.time = params.fetch("query_time")
    the_plan.user_id = params.fetch("query_user_id")
    the_plan.username = params.fetch("query_username")

    if the_plan.valid?
      the_plan.save
      redirect_to("/plans", { :notice => "Plan created successfully." })
    else
      redirect_to("/plans", { :alert => the_plan.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_plan = Plan.where({ :id => the_id }).at(0)

    the_plan.activity = params.fetch("query_activity")
    the_plan.time = params.fetch("query_time")
    the_plan.user_id = params.fetch("query_user_id")
    the_plan.username = params.fetch("query_username")

    if the_plan.valid?
      the_plan.save
      redirect_to("/plans/#{the_plan.id}", { :notice => "Plan updated successfully."} )
    else
      redirect_to("/plans/#{the_plan.id}", { :alert => the_plan.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_plan = Plan.where({ :id => the_id }).at(0)

    the_plan.destroy

    redirect_to("/plans", { :notice => "Plan deleted successfully."} )
  end
end
