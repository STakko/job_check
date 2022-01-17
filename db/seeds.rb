# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SharedUser.create!(
  email: "test@test.com",
  password: "000000",
  )

Admin.create!(
  email: "admin@test.com",
  password: "111111",
  )

9.times do |n|
  Client.create!(
    name: "会社#{n + 1}",
    zipcode: "000-000#{ n + 1}",
    address: "架空県架空市偽物区模造1-1-#{n + 1}",
    phone_number: "010-0000-000#{n + 1}",
    supervisor: "担当者#{n + 1}",
    supervisor_phone_number: "020-1111-000#{n + 1}"
    )
  end

10.times do |n|
  Worker.create!(
    name: "作業者#{n + 1}"
    )
  end

  def rand_date(d_from,d_to)
    from = Date.parse(d_from)
    to = Date.parse(d_to)
    days = to - from + 1
    return from + rand(days)
  end

1000.times do |n|
  Record.create!(
    worker_id: rand(1..10),
    client_id: rand(1..9),
    name: "作業#{n + 1}",
    body: "test#{n + 1}を行います",
    created_at: rand_date("2021-01-01","2022-01-17"),
  )
  end

200.times do |n|
  Event.create!(
    worker_id: rand(1..10),
    title: "予定#{n + 1}",
    content: "〇〇会社に品物#{n + 1}を納品します。",
    created_at: rand_date("2022-01-01","2022-05-31"),
    start_time: rand_date("2022-01-01-00-00-00","2022-05-31-00-00-00"),
    )
  end