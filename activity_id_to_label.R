activityIdToLabel <- function(id){
  label = switch(id, "walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")
  return(label)
}