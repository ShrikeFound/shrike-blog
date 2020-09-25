
#create me
User.destroy_all
User.create!(email:"alphaandsew@gmail.com",password: ENV["fonzo_password"],password_confirmation: ENV["fonzo_password"],admin: true)
User.create!(email:"jonathanpulido15@gmail.com",password: ENV["jon_password"],password_confirmation: ENV["jon_password"],admin: true)


# #create fake posts
# Post.destroy_all
# 15.times do |i|
#   post = Post.new 
#   post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
#   post.description = Faker::TvShows::Buffy.quote
#   post.body  = Faker::Lorem.paragraph_by_chars(number: 1500)
#   post.user  = User.first 
#   post.thumbnail.attach(io: open("https://picsum.photos/1920/1080"),filename: "#{i}_thumbnail.jpg")
#   post.banner.attach(io: open("https://picsum.photos/1920/1080"),filename: "#{i}_banner.jpg")
#   post.views = Faker::Number.between(from: 1, to: 5000)
#   post.save
# end