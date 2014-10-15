%w(author photographer illustrator editor publisher).each do |role|
  Role.create!(name: role)
end
