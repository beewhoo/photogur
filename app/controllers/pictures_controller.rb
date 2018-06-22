class PicturesController < ApplicationController

  def index
   @pictures_recent = Picture.most_recent_four
   @month_old       = Picture.created_before(Time.now - 1.month)
   @last_photo      = Picture.all.sample


  end

  def show
    @picture        = Picture.find(params[:id])
    @comment        = Comment.new
    @comments        = @picture.comments
  end

  def new
    @picture_new    = Picture.new

  end

  def edit
    @picture        = Picture.find(params[:id])
  end

  def update
    @picture        = Picture.find(params[:id])

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

    if  @picture_new.save
        redirect_to "/pictures"
      else
        render :new
    end



end


  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:success] = "Product successfully deleted!"
    redirect_to root_url
  end


end
