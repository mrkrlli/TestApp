Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "pages#show", page: "home"

  authenticate :user do
    get '/purchase', to: 'pages#show', page: "purchase"
    post '/stripe_subscription', to: 'stripesubscription#create',
      as: 'stripesubscription'
  end
end
