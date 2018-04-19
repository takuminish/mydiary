# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(
  name: 'testuser1',
  password: 'testuser1'
)

user2 = User.create(
  name: 'testuser2',
  password: 'testuer2'
)

diary1 = Diary.create(
  statement: 'aaa',
  display_date: '2018.01.01(月)',
  user_id: user1.id
)

diary2 = Diary.create(
  statement: 'bbb',
  display_date: '2018.01.02(火)',
  user_id: user1.id
)

diary3 = Diary.create(
  statement: 'ccc',
  display_date: '2018.01.03(水)',
  user_id: user2.id
)

