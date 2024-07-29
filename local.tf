locals {
  extra_tags = {
    Entity      = "DE"
    Criticality = "High"
    CostCenter  = "34343"
    Owner       = title(replace("bob-tayara", "-", " "))
 }
}