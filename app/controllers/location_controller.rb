class LocationController < ApplicationController

  def index
    @location = Location.all
  end

  def show
  end

  # GET /location/new
  def new
    @location = Location.new
  end

  # POST /location
  def create
    @location = Location.new(location_params)
    @location.user_id = current_user.id
    if Location.find_by(user_id: current_user.id) == nil
      # insert処理
      respond_to do |format|
        if @location.save
          format.html { redirect_to location_path, notice: "位置情報を登録しました。"}
          format.json { render :show, status: :created, location: @location }
        else
          format.html { render :new }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    else
      # update処理
      respond_to do |format|
        @location = Location.find_by(user_id: current_user.id)
        if @location.update(location_params)
          format.html { redirect_to location_path, notice: '位置情報を更新しました。' }
          format.json { render :show, status: :ok, location: @location }
        else
          format.html { render :edit }
          format.json { render json: @location.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
  end

  def delete
  end
  
  private 
    def location_params
      params.permit(:address, :latitude, :longitude, :user_id)
    end
end
