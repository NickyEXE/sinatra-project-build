class UsersController < ApplicationController


  get "/users/new" do
    erb :"users/new.html"
  end

  post "/users" do
    user = User.create(params)
    session[:user_id] = user.id
    redirect "/"
  end


end
