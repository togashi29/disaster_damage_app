# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Damage.create(title: "畦畔崩落", place: "中川代", description: "湛水不可", amount: 100000, user_id: 1)
Damage.create(title: "そば冠水", place: "川代山", description: "全滅", amount: 200000, user_id: 1)
Damage.create(title: "水路せき止め", place: "上野新田", description: "流木が障害物となっている。", amount: 300000, user_id: 1)
