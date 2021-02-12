Rails.application.routes.draw do
  root "pins#index"
  resources :comments
  devise_for :users

  resources :pins do 
    member do
      put "like", to: "pins#upvote"
    end 
    resources :comments
    
  end
  
  
  
  # resources :categories

end
