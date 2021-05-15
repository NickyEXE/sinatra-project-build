class SharksController < ApplicationController

  # new
  get "/sharks/new" do
    redirect_if_not_logged_in
    @shark = Shark.new
    erb :"sharks/new.html"
  end

  # create
  post "/sharks" do
    shark = current_user.sharks.create(params[:shark])
    if shark.valid?
      redirect "/sharks/#{shark.id}"
    else
      flash[:errors] = shark.errors.full_messages
      redirect "/sharks/new"
    end
  end

  # index
  get "/sharks" do
    if params[:search]
    # if we're searching, only render some sharks
      @sharks = Shark.where('name LIKE ?', "%#{params[:search]}%")
    else
    # otherwise render all sharks
      @sharks = Shark.all
    end
    erb :"sharks/index.html"
  end

  # show
  get "/sharks/:id" do
    @shark = Shark.find(params[:id])
    erb :"sharks/show.html"
  end

  # edit

  get "/sharks/:id/edit" do
    redirect_if_not_logged_in
    @shark = Shark.find(params[:id])
    erb :"sharks/edit.html"
  end

  patch "/sharks/:id" do
    shark = Shark.find(params[:id])
    if shark.user == current_user
      if shark.update(params[:shark])
        redirect "/sharks/#{shark.id}"
      else
        flash[:errors] = shark.errors.full_messages
        redirect "/sharks/#{shark.id}/edit"
      end
    else
      puts "Someone just tried to hack us wth"
    end
  end

  patch "/sharks/:id/birthday" do
    shark = Shark.find(params[:id])
    if shark.user == current_user
      if shark.increment_birthday
        flash[:birthday] = true
        redirect "/sharks/#{shark.id}"
      else
        flash[:errors] = ["Shark is too old!!!"]
        redirect "/sharks/#{shark.id}"
      end
    else
      puts "Someone just tried to hack us wth"
    end
  end

  delete "/sharks/:id" do
    shark = Shark.find(params[:id])
    if shark.user == current_user
      shark.destroy
      redirect "/sharks"
    end
  end

end
