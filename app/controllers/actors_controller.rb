class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => @the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def insert_actor
    a = Actor.new
    a.name = params[:the_name]
    a.dob = params[:the_dob].to_d
    a.bio = params[:the_bio]
    a.image = params[:the_image_url]
    a.save()

    redirect_to("/actors")
  end

  def delete_actor
    a = Actor.where({:id => params[:actor_id]}).first()
    a.destroy()

    redirect_to("/actors")
  end

  def update_actor
    the_id = params[:actor_id]
    a = Actor.where({:id => the_id}).first()
    a.name = params[:the_name]
    a.dob = params[:the_dob].to_d
    a.bio = params[:the_bio]
    a.image = params[:the_image_url]
    a.save()

    redirect_to("/actors/#{the_id}")
  end

end
