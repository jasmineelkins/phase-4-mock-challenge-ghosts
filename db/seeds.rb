# Write your seeds here!
puts 'Seeding'

g1 = Ghost.create(name: 'Casper', age_at_death: 15)

h1 = HauntedHouse.create(address: '1040 Amityville Ln')

Haunting.create(ghost_id: g1.id, haunted_house_id: h1.id)

puts 'Done seeding'
