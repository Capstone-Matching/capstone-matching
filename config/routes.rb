Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profregistration", to: "profregistration#index"
  post "profregistration", to: "profregistration#create"
  get "addProjects", to: "projects#new"
  post "addProjects", to: "projects#create"
  get "projects", to:"projects#index"
  get "/profLanding", to: "prof_landing#index"
  get "StudentForm", to:"studentform#index"
  post "StudentForm", to: "studentform#create"
  get "adminlanding", to: "adminlanding#index"
  get "manageprof", to: "manageprof#index"
  post '/manageprof/save_change', to: 'manageprof#save_change', as: 'save_change'
  post '/manageprof/add_professor', to: 'manageprof#add_professor', as: 'add_professor'
  # Defines the root path route ("/")
  # root "articles#index"
  get '/devtest', to: 'dev_test#index'
  post '/devtest/upload_resume', to: 'dev_test#upload_resume'
  resources :sections, only: [:new, :create]
  get 'changeweights', to: 'changeweights#index'
  post 'changeweights/save_weights', to: 'changeweights#save_weights', as: 'save_weights'
  # get 'dev_test/classify', to: 'dev_test#classify'
  
end
