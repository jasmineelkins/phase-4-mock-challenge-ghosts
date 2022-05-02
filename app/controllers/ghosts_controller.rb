class GhostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /ghosts
  def index
    ghosts = Ghost.all
    render json: ghosts
  end

  # GET /ghosts/:id
  def show
    ghost = find_ghost
    render json: ghost
  end

  # POST /ghosts
  def create
    new_ghost = Ghost.create!(ghost_params)
    render json: new_ghost, status: :created
  end

  # UPDATE /ghosts/:id
  def update
    ghost = find_ghost
    ghost.update!(ghost_params)
    render json: ghost
  end

  # DELETE /ghosts/:id
  def destroy
    ghost = find_ghost
    ghost.destroy
    render json: {}
  end

  private

  def ghost_params
    params.permit(:name, :age_at_death)
  end

  def find_ghost
    Ghost.find_by!(id: params[:id])
  end

  def render_invalid_response(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  def render_not_found_response
    render json: { error: 'Ghost not found' }, status: :not_found
  end
end
