Rails.application.routes.draw do
  get 'admin/dashboard'
  devise_for :admins, controllers: {
    registrations: "registrations",
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Post action for the contact form in home controller
  post "/home/lead", to: "home#create_lead", as: :create_lead
  # Post action for the newsletter form in home controller
  post "/home/newsletter", to: "home#create_newsletter", as: :create_newsletter

  # Defines the root path route ("/")
  root "home#index"
end
