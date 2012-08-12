namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(full_name: "Example User",
                 artist_name: "Example Artist Name",
                 username: "foobar",
                 gender: true,
                 email: "foobar@foobar.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name  = Faker::Name.name
      artist_name  = Faker::Name.name
      email = "example-#{n+1}@foobar.com"
      password  = "password"
      User.create!(full_name: name,
                   artist_name: artist_name,
                   username: name,
                   email: email,
                   gender: true,
                   password: password,
                   password_confirmation: password)
    end
  end
end