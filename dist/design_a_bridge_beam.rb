# Elliot Jameson CAS021906
# Terminal Application
# Date created: 03/09/2019

#------------------------------------------------------------------------------------------------------------
#GEMS
require "colorize"
require "crayon"
require "artii"

#-----------------------------------------------------------------------------------------------------------
#Referenced files
require_relative "./methods"

#----------------------------------------------------------------------------------------------------------
#Implement help file
argv_copy = ARGV.map{|i| i}
ARGV.clear

#------------------------------------------------------------------------------------------------------------

#Keep track of parameters which should be displayed to user
parameters = []

#clear screen
system("clear")

#Add delay for better UI
sleep(1)

#Initial greeting
puts Crayon.bold_green("Hello Mr. Engineer.")

#Add delay for better UI
sleep(2)

#----------------------------------------------------------------------------------------------------------

#Get span input from user
puts "\nWhat is the " + Crayon.underline("span") + " of your bridge in meters?"

#method - refer to methods.rb
span = get_span(parameters)
#Add delay for better UI
sleep(1)

#clear screen
system("clear")

#----------------------------------------------------------------------------------------------------------

#Get load type input from user. The user selects the load type from a pre-determined list/array
puts parameters

#Add delay for better UI
sleep(1)

puts "\nWhat kind of " + Crayon.underline("load") + " will the bridge carry?"
#method - refer to methods.rb
dist_load = get_load_type(parameters)

# #Add delay for better UI
sleep(1)

# #clear screen
system("clear")

#-----------------------------------------------------------------------------------------------------------

#hash of beam properties: [XS area(m^2), zy (m^3)]
beam = {
    "610-UB-125": [0.016, 3.23e-3],
    "530-UB-92.4": [0.0118, 2.08e-3],
    "460-UB-82.1": [0.0105, 1.61e-3],
    "410-UB-59.1": [0.00764, 1.06e-3],
    "360-UB-56.7": [0.00724, 0.899e-3],
    "310-UB-46.2": [0.00593, 0.654e-3],
    "250-UB-37.3": [0.00475, 0.435e-3]
}

beam_keys = beam.keys
puts parameters

#Add delay for better UI
sleep(1)

puts "\nChoose a " + Crayon.underline("beam size") + " for your bridge:"

#method - refer to methods.rb
beam_size = get_beam_size(beam_keys, parameters)

#Add delay for better UI
sleep(1)

#clear screen
system("clear")

#-----------------------------------------------------------------------------------------------
puts parameters

puts "\nInclude " + Crayon.underline("self-weight") + " of beam in calculation? Yes or No."
inc_self_weight = gets.chomp

#Make sure user enters a yes or no value
inc_self_weight = inc_self_weight.downcase
until inc_self_weight == "yes" or inc_self_weight == "no"
    puts "Please answer yes or no.".colorize(:light_red)
    inc_self_weight = gets.chomp
    inc_self_weight = inc_self_weight.downcase
end 

#Add delay for better UI
sleep(1)

#Clear screen
system("clear")

parameters.push "inc_self_weight = #{inc_self_weight}"
puts parameters

steel_density = 78

if inc_self_weight == "yes"
    dist_load = dist_load + (beam[beam_size][0] * steel_density)
else
    dist_load = dist_load
end


#Set steel yield strength to 300MPa
yield_str = 300

puts bending_check(beam, beam_size, yield_str, dist_load, span, beam_keys, parameters, dist_load)