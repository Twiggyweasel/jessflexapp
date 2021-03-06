# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "admin@jessflex.com", password: "testing123", role: 0)
User.create(email: "user@jessflex.com", password: "testing123", role: 1)

# activities
Exercise.create(name: "Side to Side Crawls", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Exercise.create(name: "Squat & Curtsey", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Exercise.create(name: "Fire Hydrants", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Exercise.create(name: "Reverse Lunges", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
Exercise.create(name: "Burpees", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Exercise.create(name: "Step Ups", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Exercise.create(name: "Squat & Raise Leg", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Exercise.create(name: "Pulse Squats", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

Exercise.create(name: "Side Lunge", simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 1, set_label: 0, has_weight: false, machine_based: false)

# machines 
Machine.create(name: "Rowing Machine")

# workouts
Workout.create(title: "Workout 1", description: "this is a simple description", status: "active", difficulty: Workout.difficulties.keys[0], duration: 600)

Workout.create(title: "Workout 2", description: "this is a simple description", status: "active", difficulty: Workout.difficulties.keys[0], duration: 600)



# variations

sets = [4, 4, 4, 4, 3, 4, 4, 4, 4]
reps = [12, 12, 12, 12, 10, 12, 12, 20, 12]
exercise = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
9.times do 
  Series.create(set: sets[count], rep: reps[count], exercise: Exercise.find(exercise[count]))
  count += 1
end  

Exercise.all.each do |exercise|
  Variation.create(description: "NA", exercise: exercise)
end

# Exercise.last.variations.create(description: "This is a test")

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

list_of_exercises = [
  "Bent Over Rows",
  "Deadlifts",
  "Lat Pulls",
  "Cable Rows",
  "Good-Mornings",
  "Pull-ups",
  "Concentrated Curls",
  "Side Curls",
  "Cable Curls",
  "Cable Close Grip Curls",
  "Skull Crushers",
  "Cable Extensions",
  "Close Grip Bench Press",
  "Single-Handed Bent Extensions",
  "Concentrated Cable Extensions",
  "Flat Bench Press",
  "Incline Bench Press",
  "Decline Bench Press",
  "Lower Cable Extensions",
  "Upper Cable Extensions",
  "Fly Machine",
  "Shoulder Press",
  "Front Raises",
  "Side Raises",
  "Squat",
  "Leg Raises",
  "Leg Presses",
  "Leg Curls",
  "Calves Raises",
  "Crunches",
  "Hanging Leg Raises",
  "Planks",
  "Weighted Sided Standing Crunches",
  "Interval Sprints",
  "Lunges",
  "Push-ups",
  "Biking",
  "Burpees",
  "Full Lap Runs"
]

list_of_exercises.each do |e|
  Exercise.create(name: e, simple_desc: "this is a simple description", detail_desc: "this is the detailed description", location: 1, category: 0, set_label: 0, has_weight: false, machine_based: false)
end