# Elliot Jameson CAS021906
# Terminal Application
# 03/09/2019 - Begin drafting code

#----------------------------------------------------------------------------------------------------------

#Keep track of parameters which should be displayed to user
parameters = []

#clear screen
system("clear")

#Add delay for better UI
sleep(2)

#Initial greeting
puts "Hello Mr. Engineer."

#Add delay for better UI
sleep(1)

#clear screen
system("clear")

#Get span input from user
puts "What is the span of your bridge in meters?"

span = gets.chomp.to_f

#Make sure user enters a float or an integer, not a string or an array
while span == 0
    puts "Please input an integer or a float."
    span = gets.chomp.to_f
end 

#Add delay for better UI
sleep(1)

#clear screen
system("clear")

parameters.push "span = #{span} m"
puts parameters
puts "\n"

#Get load type input from user. The user selects the load type from a pre-determined list/array
puts "What kind of load will the bridge carry?"

load_type = ["pedestrian", "truck", "rail"]

puts "#{load_type[0].capitalize}, #{load_type[1]}, or #{load_type[2]}?"
# for load in load_type
#     if load_type.find_index(load) == load_type.length - 1
#     puts "or #{load}?"
#     else puts "#{load},"
#     end
# end

loading = gets.chomp

#Make sure user enters a value from the load_type array
loading = loading.downcase
until load_type.include? loading
    puts "Please enter a load type from the list above."
    loading = gets.chomp
    loading = loading.downcase
end 


# #Add delay for better UI
sleep(1)

# #clear screen
system("clear")

parameters.push "load_type = #{loading}"
puts parameters
puts "\n"

# Assign distributed load value in kN/m to load type
if loading == "pedestrian"
    dist_load = 5
elsif loading == "truck"
    dist_load = 20
else loading == "rail"
    dist_load = 25
end

#--------------------------------------------------------------------
#Method for calculating max sagging bending moment in kNm

def bending_action(dist_load, span)
    (dist_load * span ** 2) / 8
end

#---------------------------------------------------------------------

#hash of beam properties: [XS area(m^2), zy (m^3)]
beam = {
    "610-UB-125": [0.016, 3.23e-3],
    "530-UB-92.4": [0.0118, 2.08e-3]
}

# #Add delay for better UI
sleep(1)

# #clear screen
system("clear")

puts "What size beam do you want to use?"

beam_keys = beam.keys
puts beam_keys

beam_size = gets.chomp.to_sym

#Make sure user enters a value from the beam array
until beam_keys.include? beam_size
    puts "Please enter a beam specification from the list above."
    beam_size = gets.chomp.to_sym
end 

# #Add delay for better UI
sleep(1)

# #clear screen
system("clear")

parameters.push "beam_size = #{beam_size}"
puts parameters
