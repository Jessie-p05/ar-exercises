require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
# 1. Borrowing and modifying the code from Exercise one, create 3 more stores:
#   * Surrey (annual_revenue of 224000, carries women's apparel only)
#   * Whistler (annual_revenue of 1900000 carries men's apparel only)
#   * Yaletown (annual_revenue of 430000 carries men's and women's apparel)
# 2. Using the `where` class method from Active Record, fetch (a collection of) only those stores that carry men's apparel. Assign the results to a variable `@mens_stores`.
# 3. Loop through each of these stores and output their name and annual revenue on each line.
# 4. Do another fetch but this time load stores that carry women's apparel and are generating less than $1M in annual revenue.
Store.create(name:"Surrey",annual_revenue:224000,mens_apparel:false,womens_apparel:true)
Store.create(name:"Whistler",annual_revenue:1900000,mens_apparel:true,womens_apparel:false)
Store.create(name:"Yaletown",annual_revenue:430000,mens_apparel:true,womens_apparel:true)

@mens_stores = Store.where(mens_apparel: true)
# @mens_stores = Store.where({'mens_apparel'=> true})
@mens_stores.each do |mens_store|
  puts mens_store.name, mens_store.annual_revenue
end

# @womens_stores = Store.where(["womens_apparel = ? AND annual_revenue < ? ",true,1000000])

# @womens_stores = Store.where("womens_apparel = (?) AND annual_revenue < (?)",true,1000000)

@womens_stores = Store.where( "womens_apparel = :isTrue AND annual_revenue < :sales",isTrue: true,sales:1000000)

@womens_stores.each do |womens_store|
  puts womens_store.name, womens_store.annual_revenue
end