# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongitudeside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Message.destroy_all
Booking.destroy_all
Interest.destroy_all
Activity.destroy_all
User.destroy_all
Category.destroy_all
Health.destroy_all
HealthRelation.destroy_all
puts 'Creating users...'

kaka = User.create!(
  first_name: "Karine",
  last_name: "Gazarian",
  username: "Kaka",
  email: "karine.gazarian@hec.edu",
  password: "karine1991",
  age: 52,
  physical_activity: :low,
  description: "Very happy to start to workout again! I especially love ping-pong and beach volley",
  professional: false,
  avatarseed: "Coolfit/n-COLLEGEHUMOR-large570_aiiqx7.jpg"
  )
alice = User.create!(
  first_name: "Alice",
  last_name: "de Chalendar",
  username: "Louloute",
  email: "alice.dechalendar@gmail.com",
  password: "alice1991",
  age: 48,
  physical_activity: :moderate,
  description: "Hi everybody, I am looking for new yoga classes and I would be very happy to discover them with you!",
  professional: false,
  avatarseed: "Coolfit/photos-cannes-2019-monica-bellucci-fait-crepiter-les-flashs-avec-un-decollete-hypnotisant_j1nke2.jpg"
  )
vlad = User.create!(
  first_name: "Vladimir",
  last_name: "de Ziegler",
  username: "Vlad",
  email: "vladimirdeziegler@gmail.com",
  password: "123456",
  age: 78,
  physical_activity: :vigorous,
  description: "Looking for good-looking ladies to go surfing with me 😎 ",
  professional: false,
  avatarseed: "Coolfit/MV5BMjA1MjE2MTQ2MV5BMl5BanBnXkFtZTcwMjE5MDY0Nw_._V1_UX214_CR0_0_214_317_AL__khwfa6.jpg"
  )

frankie = User.create!(
  first_name: "Francesca",
  last_name: "Ingleson",
  username: "Frankie",
  email: "ingleson.fl@gmail.com",
  password: "123456",
  age: 45,
  physical_activity: :vigorous,
  description: "Let's shake our booties together ladies! ",
  professional: true,
  avatarseed: "Coolfit/fonda_jd59nt.png"
  )

puts 'Creating categories...'

endurance = Category.create!(
  description: "Endurance",
  logo: "https://static.thenounproject.com/png/987633-200.png"
  )
strength = Category.create!(
  description: "Strength",
  logo: "https://static.thenounproject.com/png/2538336-200.png"
  )
balance = Category.create!(
  description: "Balance",
  logo: "https://static.thenounproject.com/png/2143658-200.png"
  )
flexibility = Category.create!(
  description: "Flexibility",
  logo: "https://static.thenounproject.com/png/195062-200.png"
  )
team_sport = Category.create!(
  description: "Team Sport",
  logo: "https://cdn2.iconfinder.com/data/icons/basketball-7/49/40-512.png"
  )
booty_shake = Category.create!(
  description: "Booty shake",
  logo: "https://static.thenounproject.com/png/12712-200.png"
  )

puts 'Creating health benefits...'

cognitive = Health.create!(
  description: "Cognitive improvement ",
  logo: "https://static.thenounproject.com/png/339591-200.png"
)

cardiovascular = Health.create!(
 description: "Cardiovascular health",
 logo: "https://static.thenounproject.com/png/2536415-200.png"
)

stress_relief = Health.create!(
 description: "Stress relief",
 logo: "https://static.thenounproject.com/png/36468-200.png"
)

energy_boost = Health.create!(
 description: "Energy boost",
 logo: "https://static.thenounproject.com/png/2468074-200.png"
)

aphrodisiac = Health.create!(
 description: "Aphrodisiac",
 logo: "https://static.thenounproject.com/png/1055285-200.png"
)

puts 'Creating activities...'

surf = Activity.create(
  name: "Surf session at Carcavelos",
  location: "Av. Marginal 6, 2775-604 Carcavelos",
  latitude: 38.6266783,
  longitude: -9.2183177,
  time: ('2019-5-15-9-0-0'),
  duration: 120,
  fitness_level: 3,
  description: "Join my buddy and I for surfing! We are passionate but not pros so don't feel intimidated:) Surf planks to be rent prior to the session. Meeting point at the surf stop",
  photo_db: "https://www.rush.edu/sites/default/files/styles/hw_670x475/public/truth-behind-age-old-myths.jpg?itok=OAkI4PUL",
  category: endurance,
  owner: vlad,
  max_capacity: 5,
  )
  surf.health_relations.create(health: cardiovascular)
  surf.health_relations.create(health: stress_relief)
  booking = Booking.new
  booking.activity = surf
  booking.user = alice
  booking.rating = rand(1..5)
  booking.save!
  booking2 = Booking.new
  booking2.activity = surf
  booking2.user = kaka
  booking2.rating = rand(1..5)
  booking2.save!

activity = Activity.create(
  name: "Yoga and relaxation class",
  location: "R. das Portas de Santo Antão 27 Floor 1, 1150-264 Lisboa",
  latitude: 38.7277216,
  longitude: -9.1431199,
  time: ('2020-6-8-18-0-0'),
  duration: 90,
  fitness_level: 3,
  description: "Yoga Bikram is made for you if you want to sweat in a relaxing environment. Meeting at Ministry of yoga, 15€ per person to enjoy this amazingly soothing setting",
  photo_db: "https://www.rayyogastudio.ca/wp-content/uploads/2017/07/Senior-Yoga-650x360.jpg",
  category: flexibility,
  owner: frankie,
  max_capacity: 10,
  )
  activity.health_relations.create(health: aphrodisiac)
  activity.health_relations.create(health: stress_relief)

  booking = Booking.new
  booking.activity = activity
  booking.user = alice
  booking.rating = rand(1..5)
  booking.save!

activity = Activity.create(
  name: "Meditation walk in Gulbenkian Park",
  location: "Avenida de Berna 45, 1050-078 Lisboa",
  latitude: 38.73674,
  longitude: -9.1540528212584,
  time: ('2020-6-10-17-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Let's meet all together for a meditative walk in the park! The session will be divided into 2 parts: 40 minutes of active walk followed by a meditation session.",
  photo_db: "https://www.redbridge.gov.uk/media/5188/walk-to-health-summer-1140x500.jpg",
  category: endurance,
  owner: alice,
  max_capacity: nil,
  )
  activity.health_relations.create(health: cognitive)
  activity.health_relations.create(health: stress_relief)
  booking = Booking.new
  booking.activity = activity
  booking.user = vlad
  booking.rating = rand(1..5)
  booking.save!
  booking2 = Booking.new
  booking2.activity = activity
  booking2.user = kaka
  booking2.rating = rand(1..5)
  booking2.save!

activity = Activity.create(
  name: "Zumba class @Le Wagon",
  location: "Rua do Conde de Redondo 91B, 1150-103 Lisboa",
  latitude: 38.7521753,
  longitude: -9.1971941,
  time: ('2020-6-11-11-11-0'),
  duration: 60,
  fitness_level: 2,
  description: "The perfect activity to pratice with fun music. 10€ per person, beginners welcome!",
  photo_db: "https://www.verywellhealth.com/thmb/Y4d_LondfASYl4QrQoOsVU1YZ4Y=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-186851752-57290ef95f9b589e34f1374f.jpg",
  category: booty_shake,
  owner: frankie,
  max_capacity: 10,
  )
  activity.health_relations.create(health: cardiovascular)
  activity.health_relations.create(health: aphrodisiac)

  booking = Booking.new
  booking.activity = activity
  booking.user = alice
  booking.rating = rand(1..5)
  booking.save!
  booking2 = Booking.new
  booking2.activity = activity
  booking2.user = kaka
  booking2.rating = rand(1..5)
  booking2.save!

activity = Activity.create(
  name: "Surf session at Carcavelos",
  location: "Av. Marginal 6, 2775-604 Carcavelos",
  latitude: 38.6266783,
  longitude: -9.2183177,
  time: ('2020-6-12-9-0-0'),
  duration: 120,
  fitness_level: 3,
  description: "Join my buddy and I for surfing! We are passionate but not pros so don't feel intimidated:) Surf planks to be rent prior to the session. Meeting point at the surf stop",
  photo_db: "https://www.rush.edu/sites/default/files/styles/hw_670x475/public/truth-behind-age-old-myths.jpg?itok=OAkI4PUL",
  category: endurance,
  owner: vlad,
  max_capacity: 1,
  )
  activity.health_relations.create(health: cardiovascular)
  activity.health_relations.create(health: stress_relief)
  booking2 = Booking.new
  booking2.activity = activity
  booking2.user = kaka
  booking2.rating = rand(1..5)
  booking2.save!

activity = Activity.create(
  name: "Afro Dance at Fit Place Benfica",
  location: "Avenida do Uruguai 20A, 1500-613 Lisboa",
  latitude: 38.7521753,
  longitude: -9.1971941,
  time: ('2020-6-12-11-0-0'),
  duration: 60,
  fitness_level: 2,
  description: "Initiation to African dance. Next theme: Mozambic dance! 10€ per person",
  photo_db: "http://nebula.wsimg.com/c85183f1044cd015bc48718585dc823a?AccessKeyId=88507A2F19ED52F3C364&disposition=0&alloworigin=1",
  category: booty_shake,
  owner: frankie,
  max_capacity: 10,
  )
  activity.health_relations.create(health: cardiovascular)
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: aphrodisiac)

activity = Activity.create(
  name: "Fitness at Praia da Rainha",
  location: "Largo da Praia da Rainha 121, 2750-642 Cascais",
  latitude: 38.6968919,
  longitude: -9.4204495,
  time: ('2020-6-13-9-0-0'),
  duration: 45,
  fitness_level: 2,
  description: "Do you want to get your summer body ready? Try this easy bodysculpting session! 5€ per person",
  photo_db: "http://northrustico.com/wp-content/uploads/2018/05/healthy-lifestyle-lounge-beach-workout-port-melbou21.jpg",
  category: strength,
  owner: frankie,
  max_capacity: 10,
  )
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)

  booking = Booking.new
  booking.activity = activity
  booking.user = vlad
  booking.rating = rand(1..5)
  booking.save!

activity = Activity.create(
  name: "Beach volley initiation",
  location: "Largo da Estação, 2750-340 Cascais",
  latitude: 38.6968919,
  longitude: -9.4204495,
  time: ('2020-6-15-10-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Want to impress your friends during your next vacations? Let's learn beach volley all together! Meeting point at Cascais train station ",
  photo_db: "https://t3.ftcdn.net/jpg/02/11/60/86/240_F_211608648_66cBwuEDhCfdDNnED8hI2UpOkUqWuz4q.jpg",
  category: team_sport,
  owner: vlad,
  max_capacity: 5,
  )
  health_relation = HealthRelation.create
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)

activity = Activity.create(
  name: "Football in Eduardo VII park",
  location: "Alameda Edgar Cardoso, 1070-051 Lisboa",
  latitude: 38.6968919,
  longitude: -9.4204495,
  time: ('2020-6-17-11-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Committed players wanted! You can also start out as a beginner, you will learn and improve with the team:)",
  photo_db: "http://assets-news-bcdn-ll.dailyhunt.in/cmd/resize/400x400_60/fetchdata13/images/1d/2b/c2/1d2bc2032497a75be20a6a406e0c57e3.jpg",
  category: team_sport,
  owner: vlad,
  max_capacity: 15,
  )
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)

activity = Activity.create(
  name: "Synchronized swimming (Men only)",
  location: "Portugal, Campo de Santa Clara 33, Lisboa",
  latitude: 38.6968919,
  longitude: -9.4204495,
  time: ('2020-6-17-11-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Let's build a team and participate to the synchronized swimming world cup!",
  photo_db: "https://images.radio-canada.ca/q_auto,w_1600/v1/ici-regions/16x9/le_grand_bain_homme_slip.jpg",
  category: team_sport,
  owner: vlad,
  max_capacity: 10,
  )
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)

activity = Activity.create(
  name: "Salsa in Principe Real",
  location: "R. da Escola Politécnica 56/58, 1250-102 Lisboa",
  latitude: 38.7521753,
  longitude: -9.1971941,
  time: ('2020-6-13-18-0-0'),
  duration: 60,
  fitness_level: 2,
  description: "Want to improve your dance move with your partner? Join me at this salsa event and let's dance! Meeting at botanical garden entrance.",
  photo_db: "https://www.ageukmobility.co.uk/media/cache/default_530/upload/1b/a6/1ba6dc33c20503917c2cb3b8a96f301dd358c044.jpeg",
  category: booty_shake,
  owner: alice,
  max_capacity: 20,
  )
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)
  activity.health_relations.create(health: aphrodisiac)

  booking = Booking.new
  booking.activity = activity
  booking.user = vlad
  booking.rating = rand(1..5)
  booking.save!

activity = Activity.create(
  name: "Aquafitness",
  location: "R. de Campolide 237, 1070-030 Lisboa",
  latitude: 38.73674,
  longitude: -9.1540528212584,
  time: ('2020-6-20-11-0-0'),
  duration: 40,
  fitness_level: 3,
  description: "Let's do some cardio together! Meeting in the swimming pool and bring your swimsuit!",
  photo_db: "http://www.mode-beaute.info/wp-content/uploads/2017/02/avoir-de-beaux-abdos-avec-laquafitness.jpg",
  category: endurance,
  owner: frankie,
  max_capacity: 25,
  )
  activity.health_relations.create(health: energy_boost)
  activity.health_relations.create(health: cardiovascular)

  booking = Booking.new
  booking.activity = activity
  booking.user = alice
  booking.rating = rand(1..5)
  booking.save!
  booking2 = Booking.new
  booking2.activity = activity
  booking2.user = kaka
  booking2.rating = rand(1..5)
  booking2.save!

puts 'Finished!'
