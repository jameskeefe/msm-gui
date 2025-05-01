class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    @the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => @the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def insert_movie
    m = Movie.new
    m.title = params[:the_title]
    m.year = params[:the_year].to_i
    m.duration = params[:the_duration].to_i
    m.description = params[:the_desc]
    m.image = params[:the_image_url]
    m.director_id = params[:the_director_id]
    m.save()

    redirect_to("/movies")
  end

  def delete_movie
    m = Movie.where({:id => params[:movie_id]}).first()
    m.destroy()

    redirect_to("/movies")
  end

  def update_movie
    the_id = params[:movie_id]
    m = Movie.where({:id => the_id}).first()
    m.title = params[:the_title]
    m.year = params[:the_year].to_i
    m.duration = params[:the_duration].to_i
    m.description = params[:the_desc]
    m.image = params[:the_image_url]
    m.director_id = params[:the_director_id]
    m.save()

    redirect_to("/movies/#{the_id}")
  end


end
