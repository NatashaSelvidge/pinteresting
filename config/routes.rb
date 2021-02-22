Rails.application.routes.draw do
  
  root "pins#index"
  
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :pins do 
    member do
      put "like", to: "pins#upvote"
    end 
    resources :comments
    
  end 

  # resources :categories
end


  
  
