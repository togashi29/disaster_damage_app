class DamagesController < ApplicationController
  # before_action:
  # require 'exifr'

  def index
    @damages = Damage.all
    @hash = Gmaps4rails.build_markers(@damages) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
    end
    @total_amount = Damage.sum(:amount)
    @total_place = Damage.count(:place)
  end

  def new
    @damage = Damage.new
  end

  def create

    # 投稿画像のexif情報からから緯度・経度を取得してDBに登録する事を試みるも、一旦断念し保留。
    # require 'exifr/jpeg'
    # @exif = EXIFR::JPEG.new(damage_params[:image])
    # @damage = Damage.new(damage_params.merge({latitude: @exif.gps_lat, longitude: @exif.gps_lng}))

    @damage = Damage.new(damage_params)

    if @damage.save
      redirect_to damages_path, notice: "「#{@damage.title}」を登録しました。"
    else
      render :new
    end

  end

  def show
    @damage = Damage.find(params[:id])
    @hash = Gmaps4rails.build_markers(@damage) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.title
    end
  end

  def edit
    @damage = Damage.find(params[:id])
  end

  def update
    @damage = Damage.find(params[:id])

    if @damage.update(damage_params)
      redirect_to damages_path, notice: "「#{@damage.title}」を更新しました。"
    else
      render :new
    end
  end

  def destroy
    @damage = Damage.find(params[:id])
    @damage.destroy
    redirect_to damages_path, notice: "「#{@damage.title}」を削除しました。"
  end

  private
    def damage_params
      params.require(:damage).permit(:title, :place, :description, :amount, :image).merge(user_id: current_user.id)
    end

end
