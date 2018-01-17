class RestaurantsController < BaseController
  protected

  def permitted_params
    params.permit(restaurant: [ :name ])
  end
end
