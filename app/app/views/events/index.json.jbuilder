json.array!(@trainings) do |trainings|
  json.title trainings.tasks
  json.start trainings.limit   
end