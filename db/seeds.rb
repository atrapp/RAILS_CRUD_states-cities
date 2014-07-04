# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


  states = State.create([    
    {name: "Alaska", abbreviation: "AK"},
    {name: "Arizona", abbreviation: "AZ"},
    {name: "California", abbreviation: "CA"},
    {name: "New York", abbreviation: "NY"},
    {name: "Oregon", abbreviation: "OR"}
  ]) 

  cities = City.create([
    {name: "Anchorage", population: "301,134", state_id: 1},
    {name: "Fairbanks", population: "31,535", state_id: 1},
    {name: "Phoenix", population: "1,513,367", state_id: 2},
    {name: "Los Angeles", population: "3,904,657", state_id: 3},
    {name: "San Francisco", population: "837,442", state_id: 3},
    {name: "Albany", population: "97,904", state_id: 4},    
    {name: "New York City", population: "8,405,837", state_id: 4},
    {name: "Portland", population: "609,456", state_id: 5}
  ])
