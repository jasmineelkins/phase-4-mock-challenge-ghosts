class HauntedHousesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  # GET /haunted_houses
  def index
    haunted_houses = HauntedHouse.all
    render json: haunted_houses
  end

  # GET /haunted_houses/:id
  def show
    haunted_house = find_haunted_house
    render json: haunted_house
  end

  # POST /haunted_houses
  def create
    new_haunted_house = HauntedHouse.create!(haunted_house_params)
    render json: new_haunted_house, status: :created
  end

  # UPDATE /haunted_houses/:id
  def update
    haunted_house = find_haunted_house
    haunted_house.update!(haunted_house_params)
    render json: haunted_house
  end

  # DELETE /haunted_houses/:id
  def destroy
    haunted_house = find_haunted_house
    haunted_house.destroy
    render json: {}
  end

  private

  def haunted_house_params
    params.permit(:address)
  end

  def find_haunted_house
    HauntedHouse.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
