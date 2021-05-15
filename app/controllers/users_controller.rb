class UsersController < ApplicationController

  # users index
  get "/users" do
    @users = User.all
    erb :"users/index.html"
  end

  get "/profile" do
    redirect "/users/#{current_user.id}"
  end

  # new
  get "/users/new" do
    erb :"users/new.html"
  end

  # users show
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"users/show.html"
  end

  # create
  post "/users" do
    user = User.new(params)
    if user.save
      flash[:success] = ["Account successfully created!"]
      session[:user_id] = user.id
      redirect "/"
    else
      # here's where we handle errors
      flash[:errors] = user.errors.full_messages
      redirect "/users/new"
    end
  end


end
