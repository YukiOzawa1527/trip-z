Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  scope module: :public do
    #homesコントローラー
    root to: "homes#top"
    get "about", to: "homes#about"
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

    #usersコントローラー
    resources :users, only: [:edit, :show, :update, :destroy]
    get "my_page", to: "users#mypage"

    #postsコントローラー
    resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
      resources :pictures, only: [:create, :destroy]
    end

    #messagesコントローラー
    get "users/:id/messages" => "messages#index" ,as: "messages"
    get "users/:id/messages/:id" => "messages#show"
    post "users/:id/messages" => "messages#create"
    delete "users/:id/messages/:id" => "messages#destroy"

    #relationshipsコントローラー
    get "users/:id/relationships/follower" => "relationships#follower" ,as: "follower"
    get "users/:id/relationships/followed" => "relationships#followed" ,as: "followed"
    post "users/:id/relationships" => "relationships#create" ,as: "relationships"
    delete "users/:id/relationships/:id" => "relationships#destroy"


  end

  namespace :admin do
    #homesコントローラー
    root to: "homes#top"
    get "about" => "homes#about"
    
    #postsコントローラー
    resources :posts, only: [:index, :show, :destroy]

    #usersコントローラー
    resources :users, only: [:index, :show, :update, :destroy]

    get '/search', to: 'searches#search'
  end


  get '/search', to: 'searches#search'


  
end
