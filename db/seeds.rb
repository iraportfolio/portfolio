if User.all.size == 0
  User.create(
    email: 'portfolio@example.com',
    password: '12345678',
    password_confirmation: '12345678'
  )
end

Setting.where(env: Rails.env).first_or_create!
