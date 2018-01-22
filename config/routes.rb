Rails.application.routes.draw do
  devise_for :service_managers, module: :service_managers
  devise_for :admin_users, module: :admin_users
  devise_for :users, module: :users
  root to: 'top#index'
end
