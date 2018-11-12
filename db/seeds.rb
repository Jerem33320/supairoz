powers = ["Ability Shift", "Absorption", "Accuracy", "Adaptation", "Aerokinesis", "Agility", "Animal Attributes", "Animal Control", "Animal Oriented Powers", "Animation", "Anti-Gravity", "Apotheosis", "Astral Projection", "Astral Trap", "Astral Travel", "Atmokinesis", "Audiokinesis", "Banish", "Biokinesis", "Bullet Time", "Camouflage", "Changing Armor", "Chlorokinesis", "Chronokinesis", "Clairvoyance", "Cloaking", "Cold Resistance", "Cross-Dimensional Awareness", "Cross-Dimensional Travel", "Cryokinesis", "Danger Sense", "Darkforce Manipulation", "Death Touch", "Density Control", "Dexterity", "Duplication", "Durability", "Echokinesis", "Elasticity", "Electrical Transport", "Electrokinesis", "Elemental Transmogrification", "Empathy", "Endurance", "Energy Absorption", "Energy Armor", "Energy Beams", "Energy Blasts", "Energy Constructs", "Energy Manipulation", "Energy Resistance", "Enhanced Hearing", "Enhanced Memory", "Enhanced Senses", "Enhanced Sight", "Enhanced Smell", "Enhanced Touch", "Entropy Projection", "Fire Resistance", "Flight", "Force Fields", "Geokinesis", "Gliding", "Gravitokinesis", "Grim Reaping", "Healing Factor", "Heat Generation", "Heat Resistance", "Human physical perfection", "Hydrokinesis", "Hyperkinesis", "Hypnokinesis", "Illumination", "Illusions", "Immortality", "Insanity", "Intangibility", "Intelligence", "Intuitive aptitude", "Invisibility", "Invulnerability", "Jump", "Lantern Power Ring", "Latent Abilities", "Levitation", "Longevity", "Magic", "Magic Resistance", "Magnetokinesis", "Matter Absorption", "Melting", "Mind Blast", "Mind Control", "Mind Control Resistance", "Molecular Combustion", "Molecular Dissipation", "Molecular Immobilization", "Molecular Manipulation", "Natural Armor", "Natural Weapons", "Nova Force", "Omnilingualism", "Omnipotence", "Omnitrix", "Orbing", "Phasing", "Photographic Reflexes", "Photokinesis", "Physical Anomaly", "Portal Creation", "Possession", "Power Absorption", "Power Augmentation", "Power Cosmic", "Power Nullifier", "Power Sense", "Power Suit", "Precognition", "Probability Manipulation", "Projection", "Psionic Powers", "Psychokinesis", "Pyrokinesis", "Qwardian Power Ring", "Radar Sense", "Radiation Absorption", "Radiation Control", "Radiation Immunity", "Reality Warping", "Reflexes", "Regeneration", "Resurrection", "Seismic Power", "Self-Sustenance", "Separation", "Shapeshifting", "Size Changing", "Sonar", "Sonic Scream", "Spatial Awareness", "Stamina", "Stealth", "Sub-Mariner", "Substance Secretion", "Summoning", "Super Breath", "Super Speed", "Super Strength", "Symbiote Costume", "Technopath/Cyberpath", "Telekinesis", "Telepathy", "Telepathy Resistance", "Teleportation", "Terrakinesis", "The Force", "Thermokinesis", "Thirstokinesis", "Time Travel", "Timeframe Control", "Toxikinesis", "Toxin and Disease Resistance", "Umbrakinesis", "Underwater breathing", "Vaporising Beams", "Vision - Cryo", "Vision - Heat", "Vision - Infrared", "Vision - Microscopic", "Vision - Night", "Vision - Telescopic", "Vision - Thermal", "Vision - X-Ray", "Vitakinesis", "Wallcrawling", "Weapon-based Powers", "Weapons Master", "Web Creation", "Wishing"]

puts 'Cleaning database...'
User.destroy_all
SuperHero.destroy_all
Power.destroy_all

puts 'Creating users...'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    picture: 'picture.jpg',
    address: Faker::Address.city,
    password: 'secret'
  )
  user.save!
end



puts 'Creating super heros...'

50.times do
  super_hero = SuperHero.new(
    name: Faker::Superhero.name,
    address: Faker::Address.city,
    picture: 'picture.jpg',
    price: (10..20).to_a.sample,
    user_id: (1..10).to_a.sample
  )
  super_hero.save!
end

puts 'Creating powers...'

powers.each do |power|
  Power.create!(name: power)
end

puts 'Finished!'
