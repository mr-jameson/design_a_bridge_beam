# # Elliot Jameson CAS021906
# # Terminal Application
# # 03/09/2019 - Begin drafting code

# #---------------------------------------------------

# require "cle"

# #Initial greeting
# puts "Hello Mr. Engineer."

# #Add delay for better UI
# sleep(1)

# #clear screen
# system("clear")

# #Get span input from user
# puts "What is the span of your bridge in meters?"

# span = gets.chomp.to_f

# #Make sure user enters a float or an integer, not a string or an array
# while span == 0
#     puts "Please input an integer or a float"
#     span = gets.chomp.to_f
# end 

# #Add delay for better UI
# sleep(1)

# #clear screen
# system("clear")

# puts "span = #{span} m \n \n"


#Get load type input from user. The user selects the load type from a pre-determined list/array
puts "What kind of load will the bridge carry?"

load_type = ["pedestrian", "truck", "rail"]

for load in load_type
    if load_type.find_index(load) == load_type.length - 1
    puts "or #{load}?"
    else puts "#{load},"
    end
end

loading = gets.chomp

#Make sure user enters a value from the load_type array
until load_type.include? loading
    puts "Please enter a load type from the list above."
    loading = gets.chomp
end 

puts "load_type = #{loading}"
