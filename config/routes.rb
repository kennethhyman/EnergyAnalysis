Rails.application.routes.draw do
  get 'countries/new'

  get '/home' => 'static_pages#home'

  get '/analysis' => 'static_pages#analysis'

  get '/futurestudy' => 'static_pages#future_study'

  get '/bibliography' => 'static_pages#bibliography'

  get '/conclusion' => 'static_pages#conclusion'

  get 'countries/total_x_gdp_graph/:country(.:format)' => 'countries#total_x_gdp_graph'
  get 'countries/total_x_imr_graph/:country(.:format)' => 'countries#total_x_imr_graph'
  get 'countries/percent_x_gdp_graph/:country(.:format)' => 'countries#percent_x_gdp_graph'
  get 'countries/percent_x_imr_graph/:country(.:format)' => 'countries#percent_x_imr_graph'

  resources :countries

  root 'static_pages#home'
end
