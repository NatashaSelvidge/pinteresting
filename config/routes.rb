Rails.application.routes.draw do
  
  root "pins#index"


  get 'commented_pins/my_pinboard', to: 'commented_pins#my_pinboard'
  get 'commented_pins/my_comments', to: 'commented_pins#my_comments'

  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do 
    resources :commented_pins
  end 
  
  resources :pins do 
    member do
      put "like", to: "pins#upvote"
    end 
    resources :comments
    
  end 

  
end


  
  
