require 'faker'

admin = User.new(
  name:        'Admin User',
  email:       'admin@example.com',
  password:    'helloworld',
  role:        'admin'
)
admin.skip_conirmation!
admin.save!

member = User.new(
  name:       'Member User',
  email:      'member@example.com',
  password:   'helloworld'
  )
  member.skip_confirmation!
  member.save!

puts "Seed finished"