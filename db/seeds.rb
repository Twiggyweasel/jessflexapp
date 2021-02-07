# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.create(name: "Chest Press", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 0, category: 0, set_label: 0, has_weight: true, machine_based: false)

Activity.create(name: "Rowing", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 0, category: 0, set_label: 0, has_weight: false, machine_based: false)

Activity.create(name: "Super Rowing", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 0, category: 0, set_label: 0, has_weight: true, machine_based: false)

Machine.create(name: "Rowing Machine")

MachineActivity.create(activity: Activity.find(2), machine: Machine.first)
MachineActivity.create(activity: Activity.last, machine: Machine.first)

count = 0
weights = [10, 20, 30]
3.times do 
  Variation.create(weight: weights[count], set: 3, rep: 10, difficulty: Variation.difficulties.keys[count], activity: Activity.first)
  count += 1
end  

