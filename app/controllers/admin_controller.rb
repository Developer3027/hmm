class AdminController < ApplicationController
  before_action :authenticate_admin
  def dashboard
    @newsletters = Newsletter.all
    @leads = Lead.all
  end

  # action to only allow admins
  def authenticate_admin
    if !admin_signed_in?
      flash[:alert] = "Admin only."
      redirect_to root_path
    end
  end
end
