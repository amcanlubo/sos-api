FactoryBot.define do
  factory(:user) do
    email { "user@email.com" }
    password { "testpassword" }
    first_name { "user" }
    last_name { "user" }
    mobile_number { "09999999999" }
  end

  factory(:user_in_emergency) do
    email { "user2@email.com" }
    password { "testpassword" }
    first_name { "user" }
    last_name { "user" }
    mobile_number { "09999999999" }
  end

  factory(:admin) do
    email { "admin@email.com" }
    password { "testpassword" }
    first_name { "admin" }
    last_name { "admin" }
    is_admin
  end
end
