class MeadowsController < BaseController
  protected

  def permitted_params
    params.permit(meadow: [ :restaurant_id, :name, :price ])
  end
end
