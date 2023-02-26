Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :questionnaires do
    resources :questions do
      resources :options, except: [:index]
    end
  end

  get 'home/index'
  get 'fill_questionnaire', to: 'users#fill_questionnaire'
  post 'submit_answers', to: 'users#submit_answers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
