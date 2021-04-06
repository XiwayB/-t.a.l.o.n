# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create!(
  role: 'patient',
  status: 'critical',
  open_id: '1334',
  location: {longitude: '113.937888', latitude: '22.524888'}
  )

User.create!(
  role: 'medic',
  status: 'healthy',
  open_id: '1134',
  location: {longitude: '113.937999', latitude: '22.524999'}
  )

User.create!(
  role: 'patient',
  status: 'non-critical',
  open_id: '1234',
  location: {longitude: '113.937777', latitude: '22.524777'}
  )
