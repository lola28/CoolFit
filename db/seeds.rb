# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Booking.destroy_all
Interest.destroy_all
Activity.destroy_all
User.destroy_all
Category.destroy_all
#Message.destroy_all
#Health.destroy_all
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
  avatar: "http://i.huffpost.com/gen/1853815/images/n-COLLEGEHUMOR-large570.jpg"
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
  avatar: "https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2F2019.2F05.2F18.2F0bd86994-eeea-485f-98fc-7c304a273585.2Ejpeg/480x480/quality/80/photos-cannes-2019-monica-bellucci-fait-crepiter-les-flashs-avec-un-decollete-hypnotisant.jpg"
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
  avatar: "https://c8.alamy.com/compes/pne7k7/prod-db-e-araquel-egoli-tossell-film-erfttal-film-pantalla-siren-fotos-dr-hector-et-la-recherche-du-bonheur-hector-y-la-busqueda-de-la-felicidad-de-peter-chelsom-2014-todoscangbafr-du-sud-avec-christopher-plummer-retrato-vieux-surfeur-planche-de-surf-daprs-le-roman-de-franois-lelord-le-voyage-dhector-ou-la-recherche-de-bonheur-pne7k7.jpg"
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
  avatar: "https://images2.minutemediacdn.com/image/upload/c_fill,g_auto,h_1248,w_2220/v1555434014/shape/mentalfloss/fonda.png?itok=tYLCDXlS"
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
  logo: "https://static.thenounproject.com/png/1468417-200.png"
  )
booty_shake = Category.create!(
  description: "Booty shake",
  logo: "https://static.thenounproject.com/png/12712-200.png"
  )
# puts 'Creating health benefits...'
# cognitive = Health.create!(
#  description: "Cognitive improvement",
#  logo: "https://static.thenounproject.com/png/339591-200.png"
#  )
# cardiovascular = Health.create!(
#  description: "Cardiovascular health",
#  logo: "https://static.thenounproject.com/png/2536415-200.png"
#  )
# stress_relief = Health.create!(
#  description: "Stress relief",
#  logo: "https://static.thenounproject.com/png/36468-200.png"
#  )
# energy_boost = Health.create!(
#  description: "Energy boost",
#  logo: "https://static.thenounproject.com/png/2468074-200.png"
#  )
# aphrodisiac = Health.create!(
#  description: "Aphrodisiac",
#  logo: "https://static.thenounproject.com/png/1055285-200.png"
#  )
puts 'Creating activities...'
activity = Activity.new(
  name: "Yoga Bikram",
  location: "Le Wagon, Rua do Conde de Redondo 91B, 1150-103 Lisboa",
  lat: 38.7277216,
  long: -9.1431199,
  time: ('2019-6-8-18-0-0'),
  duration: 90,
  fitness_level: 3,
  description: "Yoga Bikram is made for you if you want to sweat in a relaxing environment",
  photo_db: "https://img.grouponcdn.com/deal/KnjLRN3aByLDyNaZRYmzXucTo2r/Kn-1500x900/v1/c700x420.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = aphrodisiac
  #health_benefits.health = stress_relief
  activity.category = flexibility
  activity.user = frankie
  activity.save!
activity = Activity.new(
  name: "Meditation walk",
  location: "Gulbenkian Park, Avenida de Berna 45, 1050-078 Lisboa",
  lat: 38.73674,
  long: -9.1540528212584,
  time: ('2019-6-10-17-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Let's meet all together for a meditative walk in the park! The session will be divided into 2 parts: 40 minutes of active walk followed by a meditation session.",
  photo_db: "https://www.redbridge.gov.uk/media/5188/walk-to-health-summer-1140x500.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = cognitive
  #health_benefits.health = stress_relief
  activity.category = endurance
  activity.user = alice
  activity.save!
  activity = Activity.new(
  name: "Zumba class",
  location: "Fit Place Benfica, Avenida do Uruguai 20A, 1500-613 Lisboa",
  lat: 38.7521753,
  long: -9.1971941,
  time: ('2019-6-11-11-11-0'),
  duration: 60,
  fitness_level: 2,
  description: "This is a perfect activity to pratice with fun music!",
  photo_db: "https://previews.123rf.com/images/kzenon/kzenon1410/kzenon141000291/32939198-groupe-d-hommes-et-de-femmes-qui-dansent-zumba-fitness-chor%C3%A9graphie-%C3%A0-l-%C3%A9cole-de-danse.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = aphrodisiac
  #health_benefits.health = cardiovascular
  activity.category = booty_shake
  activity.user = frankie
  activity.save!
activity = Activity.new(
  name: "Surf class",
  location: "Estrada Florestal da Fonte da Telha - Praia da Mata, bus_stop, Costa de Caparica, Portugal",
  lat: 38.6266783,
  long: -9.2183177,
  time: ('2019-6-12-9-0-0'),
  duration: 120,
  fitness_level: 3,
  description: "Wanna try surfing? Come to this session and enjoy the beach! Surf planks to be rent prior to the session. Meeting point at the surf stop",
  photo_db: "https://theperfectwave.itravelsoftware.com/fotografije_itravel/2129/4692_635568970057304036_520_345.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = cardiovascular
  #health_benefits.health = stress_relief
  activity.category = endurance
  activity.user = vlad
  activity.save!
activity = Activity.new(
  name: "Afro Dance",
  location: "Fit Place Benfica, Avenida do Uruguai 20A, 1500-613 Lisboa",
  lat: 38.7521753,
  long: -9.1971941,
  time: ('2019-6-12-11-0-0'),
  duration: 60,
  fitness_level: 2,
  description: "Initiation to African dance. Next theme: Mozambic dance!",
  photo_db: "http://nebula.wsimg.com/c85183f1044cd015bc48718585dc823a?AccessKeyId=88507A2F19ED52F3C364&disposition=0&alloworigin=1"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = cardiovascular
  #health_benefits.health = energy_boost
  #health_benefits.health = aphrodisiac
  activity.category = booty_shake
  activity.user = frankie
  activity.save!
activity = Activity.new(
  name: "Musculation at the beach",
  location: "Cascais, meeting point at the train station",
  lat: 38.6968919,
  long: -9.4204495,
  time: ('2019-6-13-9-0-0'),
  duration: 45,
  fitness_level: 2,
  description: "Do you want to get your summer body ready? Let's try this easy musculation session!",
  photo_db: "http://northrustico.com/wp-content/uploads/2018/05/healthy-lifestyle-lounge-beach-workout-port-melbou21.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = cardiovascular
  #health_benefits.health = energy_boost
  activity.category = strength
  activity.user = vlad
  activity.save!
activity = Activity.new(
  name: "Beach volley initiation",
  location: "Cascais, meeting point at the train station",
  lat: 38.6968919,
  long: -9.4204495,
  time: ('2019-6-15-10-0-0'),
  duration: 60,
  fitness_level: 1,
  description: "Want to impress your friends during your next vacations? Let's learn beach volley all together! ",
  photo_db: "https://www.pgvb.fr/media/uploaded/sites/8841/actualite/59042ff349574_untournoitresreussidebeachvolleyaportandro3037090.jpg"
  )
  #health_benefits.new
  #health_benefits.activity = activity
  #health_benefits.health = cardiovascular
  #health_benefits.health = energy_boost
  activity.category = team_sport
  activity.user = vlad
  activity.save!
  ### fake booking
puts 'fake booking'
  booking = Booking.new
  booking.user = kaka
  booking.activity = activity
  booking.save
puts 'Finished!'
