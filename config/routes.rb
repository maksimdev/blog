Rails.application.routes.draw do
  post 'posts/create'
  post 'ratings/create'
  get 'posts/index'
  get 'posts/list'
end
