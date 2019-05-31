Adding capacity criteria to activities


# User-Stories

# A) User Story: Want to check available capacity in a class...
# B) User Story: Can only register in a class if not full...


# Database
# 1) Add column "MaxCapacity" to table "Activity", storing value as integer
e.g. Activity.max_capacity = 10
# 2) Add column "CurrentCapacity" to table "Activity", storing value as integer
e.g. Activity.current_capacity = 5


# Model: Activity
# A user registers in a class...--> (BookingsController#create)
e.g. Activity.current_capacity += 1


# Controller: BookingsController#create
  if Activity.current_capacity >= Activity.max_capacity
    notice: Class is full!
    redirect_to activities_path
  else
    booking.save
  end


# Controller: ActivitiesController#show_capacity
  @activity = Activity.where(:max_capacity -1 < max_capacity)
