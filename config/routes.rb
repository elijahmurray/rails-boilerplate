Rails.application.routes.draw do
  get 'page/index'
  devise_for :users

  root 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # error pages
  %w( 404).each do |code|
    get code, :to => "errors#show", :code => code
  end
end
