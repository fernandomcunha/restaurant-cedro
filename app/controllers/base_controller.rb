class BaseController < ApplicationController
  inherit_resources

  def index
    @search = resource_class.search(params[:q])
    super
  end

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  protected

  def collection
    @collection ||= end_of_association_chain.search(params[:q]).result
  end
end
