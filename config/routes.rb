Rails.application.routes.draw do
  get 'emo_select/select'
  get 'emo_select/processing'
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  resources :chocolates
  
  root 'emo_select#select'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
