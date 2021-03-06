# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all

# User.create!(
#   wechat_account: 'Tom',
#   role: 'patient',
#   status: 'critical',
#   open_id: '1334',
#   location: {longitude: '113.937888', latitude: '22.524888'}
#   )

# User.create!(
#   wechat_account: 'Jerry',
#   role: 'medic',
#   status: 'healthy',
#   open_id: '1134',
#   location: {longitude: '113.937999', latitude: '22.524999'}
#   )

# User.create!(
#   wechat_account: 'Wuhu',
#   role: 'patient',
#   status: 'non-critical',
#   open_id: '1234',
#   location: {longitude: '113.937777', latitude: '22.524777'}
#   )

Message.create!(
  content: 'My first message - hey hows it going? (id 2 to id 3)',
  user_id: '2',
  receiver_id: '3',
  )

Message.create!(
  content: 'My second message - pretty good just playing with message function (id 3 to id 2',
  user_id: '3',
  receiver_id: '2',
  )

Message.create!(
  content: 'My third message - Hows it going no.4? (id 2 to id 4)',
  user_id: '2',
  receiver_id: '4',
  )

Message.create!(
  content: 'My fourth message - good heard your working on message function (id 4 to id 2',
  user_id: '4',
  receiver_id: '2',
  )
