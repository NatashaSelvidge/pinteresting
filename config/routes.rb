Rails.application.routes.draw do
  root "pins#index"
  
  resources :pins do 
    member do
    put "like", to: "pins#upvote"
    end 
  end
  
  resources :categories
  resources :comments
  devise_for :users

end
