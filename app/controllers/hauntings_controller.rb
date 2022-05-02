class HauntingsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

  # GET /hauntings
  def index
    hauntings = Haunting.all
    render json: hauntings
  end

  # GET /hauntings/:id
  def show
    haunting = find_haunting
    render json: haunting
  end

  # POST /hauntings
  def create
    new_haunting = Haunting.create!(haunting_params)
    render json: new_haunting, status: :created
  end

  # UPDATE /hauntings/:id
  def update
    haunting = find_haunting
    haunting.update!(haunting_params)
    render json: haunting
  end

  # DELETE /hauntings/:id
  def destroy
    haunting = find_haunting
    haunting.destroy
    render json: {}
  end

  private

  def haunting_params
    params.permit(:ghost_id, :haunted_house_id)
  end

  def find_haunting
    Haunting.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
