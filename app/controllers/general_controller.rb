class GeneralController < ApplicationController
  before_filter :redirect_if_current_user

  def index
    render :layout => false
  end

  def about
    render :layout => false
  end

  private

  def redirect_if_current_user
    return redirect_to dashboard_path if current_user
  end
end
