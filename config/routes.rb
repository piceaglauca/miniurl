Rails.application.routes.draw do
  resources :mini_urls

  get '/', to: 'mini_urls#new'

  get '/:short_url', to: 'mini_urls#open'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
