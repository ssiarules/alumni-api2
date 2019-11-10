Rails.application.routes.draw do
  resources :alumnus, only: [:index, :show, :destroy, :update, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
