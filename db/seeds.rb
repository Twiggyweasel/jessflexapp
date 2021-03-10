# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# activities
Activity.create(name: "Side to Side Crawls", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Activity.create(name: "Squat & Curtsey", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Activity.create(name: "Fire Hydrants", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Activity.create(name: "Reverse Lunges", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Activity.create(name: "Burpees", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Activity.create(name: "Step Ups", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Activity.create(name: "Squat & Raise Leg", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Activity.create(name: "Pulse Squats", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Activity.create(name: "Side Lunge", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

# machines 
Machine.create(name: "Rowing Machine")

# workouts
Workout.create(title: "Workout 1", description: "this is a simple description", status: "active", difficulty: Workout.difficulties.keys[0], duration: 600)

Workout.create(title: "Workout 2", description: "this is a simple description", status: "active", difficulty: Workout.difficulties.keys[0], duration: 600)



# variations

sets = [4, 4, 4, 4, 3, 4, 4, 4, 4]
reps = [12, 12, 12, 12, 10, 12, 12, 20, 12]
activity = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
9.times do 
  Series.create(set: sets[count], rep: reps[count], activity: Activity.find(activity[count]))
  count += 1
end  

Activity.all.each do |activity|
  Variation.create(description: "NA", activity: activity)
end

Activity.last.variations.create(description: "This is a test")

# # workout_variations
# count = 0
# workout = Workout.first
# Variation.all.each do |v|
#   WorkoutActivity.create(workout: workout, variation: v)
#   if count < 4
#     count += 1
#   else
#     workout = Workout.find(2)
#     count = 0
#   end
# end

Plan.create(title: "BOOTY-FULL GAINS", description: "This plan is meant to train your glutes, hamstrings, and quads. you should select new work out every day and try not to repeat.", price: 4999, status: Plan.statuses.keys[1], difficulty: Plan.difficulties.keys[1] )

PlanWorkout.create(plan: Plan.first, workout: Workout.first)
# PlanWorkout.create(plan: Plan.first, workout: Workout.second)
