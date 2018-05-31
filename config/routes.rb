BaiduUeditorRails::Engine.routes.draw do
  root to: 'assets#index', via: [:get, :post]
  post 'upload', to: 'assets#upload'
  # post 'file_upload', to: 'assets#file_upload'
  get 'list', to: 'assets#list'
end