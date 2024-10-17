class RegistrationsController < Devise::RegistrationsController
  before_action :check_registration_allowed, only: [:new, :create]

  private

  # Check if registration is allowed.
  #
  # Redirects to the root page and flashes an alert if registration is not allowed.
  def check_registration_allowed
    unless Admin.registration_allowed?
      flash[:alert] = "Registration is not allowed"
      redirect_to root_path
    end
  end
end
