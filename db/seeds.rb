# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#2.times do |i|
#  User.create(name:"test #{i}", mail_address:"test#{i}", pass_word:"test#{i}", administrator:false, state:true)
#end

#2.times do |i|
#  ToDoItem.create(title:"test #{i}", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
#  place:"test #{i}", memo:"test #{i}", attachment:"test #{i}", rank:1,remind:true, remind_time:'2017-12-31 00:00')
#end

#2.times do |i|
#  Category.create(category_name:"test#{i}", category_color:"test#{i}", background:"test#{i}")
#end

# テスト用に作る　2018.07.22
User.create(name:"ikada", mail_address:"ika@yahoo", pass_word:"ika", administrator:true, state:true)
User.create(name:"nakata", mail_address:"naka@yahoo", pass_word:"naka", administrator:false, state:true)
User.create(name:"ota", mail_address:"ota@yahoo", pass_word:"ota", administrator:false, state:true)

  # ikadaのtodo
  ToDoItem.create(user_id:1, category_id:1, title:"ika_do_1", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
  place:"ika_p_1", memo:"ikadaのtest_1", attachment:"ika#_1", rank:1,remind:false, remind_time:'2017-12-31 00:00')

  ToDoItem.create(user_id:1, category_id:2, title:"ika_do_2", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00', place:"ika_p_2", memo:"ikadaのtest_2", attachment:"ika#_2", rank:1,remind:false, remind_time:'2017-12-31 00:00')

  ToDoItem.create(user_id:1, category_id:2, title:"ika_do_3", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
  place:"ika_p_3", memo:"ikadaのtest_3", attachment:"ika#_3", rank:2,remind:false, remind_time:'2017-12-31 00:00')

 #nakataのtodo
 ToDoItem.create(user_id:2, category_id:3, title:"naka_do_1", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"naka_p_1", memo:"nakataのtest_1", attachment:"naka#_1", rank:2,remind:false, remind_time:'2017-12-31 00:00')

 ToDoItem.create(user_id:2, category_id:4, title:"naka_do_2", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"naka_p_2", memo:"nakataのtest_2", attachment:"naka#_2", rank:3,remind:true, remind_time:'2017-12-31 00:00')

 ToDoItem.create(user_id:2, category_id:4, title:"naka_do_3", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"naka_p_3", memo:"nakataのtest_3", attachment:"naka#_3", rank:1,remind:true, remind_time:'2017-12-31 00:00')

 #otaのtodo
 ToDoItem.create(user_id:3, category_id:5, title:"ota_do_1", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"ota_p_1", memo:"otaのtest_1", attachment:"ota#_1", rank:1,remind:true, remind_time:'2017-12-31 00:00')

 ToDoItem.create(user_id:3, category_id:5, title:"ota_do_2", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"ota_p_2", memo:"otaのtest_2", attachment:"ota#_2", rank:2,remind:false, remind_time:'2017-12-31 00:00')

 ToDoItem.create(user_id:3, category_id:6, title:"ota_do_3", start_date:'2018-01-01', start_time:'00:00', end_date:'2018-01-02', end_time:'00:00',
 place:"ota_p_3", memo:"otaのtest_3", attachment:"ota#_3", rank:3,remind:false, remind_time:'2017-12-31 00:00')

#ikadaのcategory
Category.create(user_id:1, category_name:'job', category_color:'red', background:'dog')
Category.create(user_id:1, category_name:'private', category_color:'blue', background:'cat')

#nakata category
Category.create(user_id:2, category_name:'xx会社', category_color:'blue', background:'sea')
Category.create(user_id:2, category_name:'yy会社', category_color:'red', background:'sky')

#ota category
Category.create(user_id:3, category_name:'buy', category_color:'white', background:'mars')
Category.create(user_id:3, category_name:'sell', category_color:'black', background:'earth')
