# Elliot Jameson CAS021906
# Terminal Application
# 03/09/2019 - Begin drafting code

#---------------------------------------------------

#Initial greeting
puts "Hello Mr. Engineer."

#Get span input from user
puts "What is the span of your bridge?"

span = gets.chomp.to_i

#Make sure user enters a float or an integer, not a string or an array
while span == 0
    puts "Please input an integer or a float"
    span = gets.chomp.to_i
end 

puts "span = #{span} m"

#Get load type input from user. The user selects the load type from a pre-determined list/array
puts "What kind of load will the bridge carry?"

load_type = ["pedestrian", "truck", "rail"]

for load in load_type
    if load_type.find_index(load) == 2
    puts "or #{load}?"
    else puts "#{load},"
    end
end