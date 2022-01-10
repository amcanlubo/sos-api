json.(user, :id, :email, :first_name, :last_name, :mobile_number)
json.token user.generate_jwt