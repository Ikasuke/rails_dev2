# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


2.times do |i|
  User.create(name:"test #{i}", mail_address:"test#{i}", pass_word:"test#{i}", administrator:false, state:true)
end

2.times do |i|
  ToDoItem.create(title:"test #{i}", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
  place:"test #{i}", memo:"test #{i}", attachment:"test #{i}", rank:1,remind:true, remind_time:'2017-12-31 00:00')
end

2.times do |i|
  Category.create(category_name:"test#{i}", category_color:"test#{i}", background:"test#{i}")
end
