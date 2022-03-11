Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :tee_boxes
  resources :holes
  resources :couses
  resources :hole_likes
  resources :course_likes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
