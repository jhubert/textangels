class GeneralController < ApplicationController
  layout false
  before_filter :redirect_if_current_user

  def index
  end

  private

  def redirect_if_current_user
    return redirect_to dashboard_path if current_user
  end
end
