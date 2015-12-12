Rails.application.routes.draw do
  get 'countries/new'

  get '/home' => 'static_pages#home'

  get '/futurestudy' => 'static_pages#future_study'

  get '/bibliography' => 'static_pages#bibliography'

  get '/conclusion' => 'static_pages#conclusion'

  #countries different routing
  resources :countries

  root 'static_pages#home'
end
