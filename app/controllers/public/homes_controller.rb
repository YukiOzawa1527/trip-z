class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'ゲスト太郎', phone_number: '030-3333-3333', prefecture_id: '5', birthday: '2025/1/1', introduction: 'ゲストです。') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
