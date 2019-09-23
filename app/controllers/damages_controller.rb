class DamagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @damages = Damage.all
    @total_amount = Damage.sum(:amount)
    @total_place = Damage.count(:place)
  end

  def new
    @damage = Damage.new
  end

  def create
    @damage = Damage.new(damage_params)

    if @damage.save
      redirect_to damages_path, notice: "「#{@damage.title}」を登録しました。"
    else
      render :new
    end

  end

  def show
    @damage = Damage.find(params[:id])
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
      params.require(:damage).permit(:title, :place, :latitude, :longitude, :description, :amount, :image).merge(user_id: current_user.id)
    end

end
