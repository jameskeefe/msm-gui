Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })

  post("/movies/insert_movie", { :controller => "movies", :action => "insert_movie" })
  get("/movies/delete_movie/:movie_id", { :controller => "movies", :action => "delete_movie" })
  post("/movies/update_movie/:movie_id", { :controller => "movies", :action => "update_movie" })
  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })

  post("/actors/insert_actor", { :controller => "actors", :action => "insert_actor" })
  get("/actors/delete_movie/:actor_id", { :controller => "actors", :action => "delete_actor" })
  post("/actors/update_movie/:actor_id", { :controller => "actors", :action => "update_actor" })

end
