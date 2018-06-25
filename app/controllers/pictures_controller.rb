class PicturesController < ApplicationController
  before_action :new_picture, only: [:new, :create]
  before_action :ensure_logged_in, except: [:index, :show]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]


  def index
   @pictures_recent = Picture.most_recent_four
   @month_old       = Picture.created_before(Time.now - 1.month)
   @last_photo      = Picture.all.sample


  end

  def show
    @comment        = Comment.new
    @comments        = @picture.comments
  end

  def new
    @picture_new    = Picture.new

  end

  def edit
  end

  def update

    @picture.title  = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url    = params[:picture][:url]

    if @picture.save
      flash[:success] = "Picture successfuly updated!"
      redirect_to picture_path(@picture)

      else
        render :edit
    end
  end


  def create
    @picture_new        = Picture.new

    @picture_new.title  = params[:picture][:title]
    @picture_new.artist = params[:picture][:artist]
    @picture_new.url    = params[:picture][:url]
    @picture_new.user = current_user


    if  @picture_new.save

        redirect_to "/pictures"
      else
        render :new
    end


  end


  def destroy
    @picture.destroy
    flash[:success] = "Product successfully deleted!"
    redirect_to root_url
  end

  def load_picture
  @picture = Picture.find(params[:id])
  end

  def ensure_user_owns_picture
  unless current_user == @picture.user
    flash[:alert] = "Please log in"
    redirect_to new_sessions_url
  end
end

  def new_picture
    @picture = Picture.new
  end







end
