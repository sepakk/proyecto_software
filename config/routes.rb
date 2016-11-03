Rails.application.routes.draw do
  
  resources :diseases
  resources :plagues
  resources :plants do
    resources :plant_diseases
    resources :plant_plagues
  	resources :cycles do
      resources :steps
    end
  end
  devise_for :users
  resources :users do
      resources :crops, only: [:show, :index] do
        resources :crop_cycles
      end
  end
  resources :crops, only: [:create] 
  root "plants#index"
  get 'pages/about'
  #match 'users/profile' => 'users#id', :via => :get
  #match 'users/profile/crops' => 'users#id/crops', :via => :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
