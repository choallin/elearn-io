Rails.application.routes.draw do
  jsonapi_resources :talents
  jsonapi_resources :authors
  jsonapi_resources :courses
end
