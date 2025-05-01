class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end


  def insert_director
    d = Director.new
    d.name = params[:the_name]
    d.dob = params[:the_dob].to_d
    d.bio = params[:the_bio]
    d.image = params[:the_image_url]
    d.save()

    redirect_to("/directors")
  end

  def delete_director
    d = Director.where({:id => params[:director_id]}).first()
    d.destroy()

    redirect_to("/directors")
  end

  def update_director
    the_id = params[:director_id]
    d = Director.where({:id => the_id}).first()
    d.name = params[:the_name]
    d.dob = params[:the_dob].to_d
    d.bio = params[:the_bio]
    d.image = params[:the_image_url]
    d.save()

    redirect_to("/directors/#{the_id}")
  end

end
