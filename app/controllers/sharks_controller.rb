class SharksController < ApplicationController

  # new
  get "/sharks/new" do
    @shark = Shark.new
    erb :"sharks/new.html"
  end

  # create
  post "/sharks" do
    shark = current_user.sharks.create(params[:shark])
    redirect "/sharks/#{shark.id}"
  end

  # index
  get "/sharks" do
    @sharks = Shark.all
    erb :"sharks/index.html"
  end

  # show
  get "/sharks/:id" do
    @shark = Shark.find(params[:id])
    erb :"sharks/show.html"
  end

  # edit

  get "/sharks/:id/edit" do
    @shark = Shark.find(params[:id])
    erb :"sharks/edit.html"
  end

  patch "/sharks/:id" do
    shark = Shark.find(params[:id])
    shark.update(params[:shark])
    redirect "/sharks/#{shark.id}"
  end

  patch "/sharks/:id/birthday" do
    shark = Shark.find(params[:id])
    shark.increment_birthday
    flash[:birthday] = true
    redirect "/sharks/#{shark.id}"
  end

  delete "/sharks/:id" do
    shark = Shark.find(params[:id])
    shark.destroy
    redirect "/sharks"
  end

end
