Rails.application.routes.draw do
  get 'private/hello'
  get 'private/open_hello'
  get 'public/hello'
  get 'auth/request_token'
  post 'signup', to: 'signup#signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
