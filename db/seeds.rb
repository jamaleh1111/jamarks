require 'faker'

admin = User.new(
  name:        'Admin User',
  email:       'admin@example.com',
  password:    'helloworld',
  role:        'admin'
)
admin.skip_confirmation!
admin.save!

puts "Seed finished"