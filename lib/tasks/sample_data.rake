namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Member.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 contact_number: "01234567")
    29.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      contact_number  = "01234567"
      Member.create!(name: name,
                   email: email,
                   contact_number: contact_number)
    end
  end
end