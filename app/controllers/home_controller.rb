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

  # POST /landing/lead
  # # Create a lead from the landing page
  def create_lead
    @lead = Lead.new(lead_params)

    if lead_params[:pp_check] == "0" || lead_params[:pp_check] == false
      redirect_to root_path, alert: "Please check the privacy policy"
    else
      respond_to do |format|
        if @lead.save
          format.html { redirect_to root_path, notice: "We will reach out soon!" }
        else
          format.html { redirect_to root_path, alert: "Failed to sign up: #{@lead.errors.full_messages.join(', ')}" }
        end
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  # This is especially important for the form that is publicly accessible.
  def lead_params
    params.require(:lead).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :phone,
                                  :city,
                                  :state,
                                  :pp_check)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # This is especially important for the form that is publicly accessible.
  def newsletter_params
    params.require(:newsletter).permit( :email, :pp_check)
  end
end
