Rails.application.routes.draw do
  resources :countries do
    get 'districts', on: :member
  end
  get "/ajax_test" => "countries#ajax_test"
  root to: "static_pages#access_service"
  get "/update_service_user" => "static_pages#update_service_user"
  get "/callback" => "static_pages#callback"
  get "/yahoo" => "static_pages#yahoo"
  post "/receive" => "static_pages#receive"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
