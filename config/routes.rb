Rails.application.routes.draw do
  get '/home' => 'static_pages#home'

  get '/about' => 'static_pages#about'

  get '/bibliography' => 'static_pages#bibliography'

  get '/conclusion' => 'static_pages#conclusion'

 root 'static_pages#home'
end
