Rails.application.routes.draw do 

  #
  root to: "main#index"

  #
  resources :apartment_details
  resources :apartments
   
  
  # DEVISE
  devise_for :users
  
  # MAIN
    get 'main/index'
    get 'main/help'
    get 'main/faq'
    get 'main/privacy'
    get 'main/legal'
    get 'main/contact'
  
   
  
    # resources :transactions
    # resources :invests
    # root to: "projects#index"
    
    # devise_for :users 
    # resources :projects
    # resources :accounts
    # resources :deposit_refunds
    # mount StripeEvent::Engine, at: '/webhooks/stripe'
  
    # # # COMMENTS
    # # resources :comments, :only => [:show, :destroy, :new, :create]
    # # resources :posts do
    # #   resources :comments, :only => [:destroy, :new, :create]
    # # end
    
    # # INVESTS
    # resources :invests, :only => [:show, :destroy, :new, :create]
    # resources :projects do
    #   resources :invests, :only => [:destroy, :new, :create]
    # end
    # # HELP
    # get '/help', to: 'mains#help' 
    # get '/tou', to: 'mains#tou' 
    # get '/ads.txt', to: 'mains#ads'
    # get '/win', to: 'mains#win'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
  