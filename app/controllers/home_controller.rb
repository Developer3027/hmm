class HomeController < ApplicationController
  # get /home
  def home; end

  # POST /home/newsletter
  # Create a newsletter from the home page
  def create_newsletter
    @newsletter = Newsletter.new(newsletter_params)

    if newsletter_params[:pp_check] == "0" || newsletter_params[:pp_check] == false
      redirect_to root_path, alert: "Please check the privacy policy"
    else
      respond_to do |format|
        if @newsletter.save
          format.html { redirect_to root_path, notice: "Thank you for signing up!" }
        else
          format.html { redirect_to root_path, alert: "Failed to sign up: #{@newsletter.errors.full_messages.join(', ')}" }
        end
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  # This is especially important for the form that is publicly accessible.
  def newsletter_params
    params.require(:newsletter).permit( :email, :pp_check)
  end
end
