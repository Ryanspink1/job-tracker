Rails.application.routes.draw do

  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

  resources :companies do
    resources :contacts#, only: [:new, :create]
  end

  resources :categories
end
