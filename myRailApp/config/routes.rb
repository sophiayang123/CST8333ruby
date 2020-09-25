Rails.application.routes.draw do
  get 'cheese/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cheese#index'

  scope :cheese do
    match 'test', to: 'cheese#cheesedata', via: [:get]
  end
end
