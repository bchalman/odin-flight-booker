Rails.application.routes.draw do
  root'flights#index', as: 'flights'
  get 'flights/index'
end
