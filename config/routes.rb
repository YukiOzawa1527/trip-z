Rails.application.routes.draw do
  namespace :public do
    get 'relationships/follower'
    get 'relationships/followed'
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :public do
    get 'messsages/index'
    get 'messsages/show'
    get 'messsages/create'
    get 'messsages/destroy'
  end
  namespace :public do
    get 'favoretes/create'
    get 'favoretes/destroy'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/create'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :public do
    get 'users/mypage'
    get 'users/edit'
    get 'users/show'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'users/index'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
  end
  namespace :admin do
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  
end
