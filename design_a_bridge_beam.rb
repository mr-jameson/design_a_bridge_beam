# Elliot Jameson CAS021906
# Terminal Application
# 03/09/2019 - Begin drafting code

#----------------------------------------------------------------------------------------------------------

#Keep track of parameters which should be displayed to user
parameters = []

#clear screen
system("clear")

#Add delay for better UI
sleep(1)

#Initial greeting
puts "Hello Mr. Engineer."

#Add delay for better UI
sleep(2)

#----------------------------------------------------------------------------------------------------------

#Get span input from user
puts "\nWhat is the span of your bridge in meters?"

def get_span(parameters)
    span = gets.chomp.to_f
        #Make sure user enters a float or an integer, not a string or an array
        while span == 0
            puts "Please input an integer or a float."
            span = gets.chomp.to_f
        end 

        if parameters.to_s.include? "span"
            parameters.delete_at(0)
            parameters.unshift "span = #{span} m"
        else
            parameters.push "span = #{span} m"
        end
        return span
end
    
span = get_span(parameters)
#Add delay for better UI
sleep(1)

#clear screen
system("clear")

#----------------------------------------------------------------------------------------------------------

#Get load type input from user. The user selects the load type from a pre-determined list/array
puts parameters
puts "\nWhat kind of load will the bridge carry?"

load_type = ["pedestrian", "road", "rail"]

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
elsif loading == "road"
    dist_load = 20
else loading == "rail"
    dist_load = 25
end

#-----------------------------------------------------------------------------------------------------------
#Method for calculating max sagging bending moment in kNm

def bending_action(dist_load, span)
    (dist_load * span ** 2) / 8
end

#-----------------------------------------------------------------------------------------------------------

#hash of beam properties: [XS area(m^2), zy (m^3)]
beam = {
    "610-UB-125": [0.016, 3.23e-3],
    "530-UB-92.4": [0.0118, 2.08e-3],
    "460-UB-82.1": [0.0105, 1.61e-3],
    "410-UB-59.1": [0.00764, 1.06e-3],
    "360-UB-56.7": [0.00724, 0.899e-3]
}

beam_keys = beam.keys
puts "Choose a beam size for your bridge:"

#--------------------------------------------------------------------------------------------------
# Define a method to get the user to input the beam size.

def get_beam_size(beam_keys, parameters)
    puts beam_keys
    beam_size = gets.chomp.to_sym
#Make sure user enters a value from the beam array
    until beam_keys.include? beam_size
        puts "Please enter a beam specification from the list above."
        beam_size = gets.chomp.to_sym
    end 

    if parameters.to_s.include? "beam_size"
        parameters.delete_at(2)
        parameters.insert(2,"beam_size = #{beam_size}")
    else
        parameters.push "beam_size = #{beam_size}"
    end
return beam_size
end
beam_size = get_beam_size(beam_keys, parameters)

#Add delay for better UI
sleep(1)

#clear screen
system("clear")

#-----------------------------------------------------------------------------------------------
puts parameters

puts "\nInclude self-weight of beam in calculation? Yes or No."
inc_self_weight = gets.chomp

#Make sure user enters a yes or no value
inc_self_weight = inc_self_weight.downcase
until inc_self_weight == "yes" or inc_self_weight == "no"
    puts "Please answer yes or no."
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
#-------------------------------------------------------------------------------------------------

#Define method for outputing bending capacity of beam in kNm
def bending_capacity(yield_str, modulus)
    yield_str * 1e6 * modulus / 1000
end

#Set steel yield strength to 300MPa
yield_str = 300
#reference modulus from beams array
modulus = beam[beam_size][1]

def bending_check(beam, beam_size, yield_str, modulus, dist_load, span, beam_keys, parameters, loading)
    if bending_capacity(yield_str, modulus) > bending_action(dist_load, span)
        puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the #{loading} load."
    else
    while bending_capacity(yield_str, modulus) <= bending_action(dist_load, span)
        system("clear")
        puts parameters
        puts "\n This beam is not strong enough. Please select a larger beam, reduce your span, or reduce your load. What would you like to do?"
        sleep (1)
        puts "\n 1. Select a larger beam
        \n 2. Reduce span
        \n 3. Reduce load \n"
        rev_input_1 = gets.chomp.to_i
        if rev_input_1 == 1
            puts "What size beam do you want to update to?"
            beam_size = get_beam_size(beam_keys, parameters)
            puts parameters
        elsif rev_input_1 == 2
            puts "What do you want to update the span to?"
            get_span(parameters)
            puts parameters
            next
        elsif rev_input_1 == 3
            break
            puts "Implement reduce_load method"
        else
            until rev_input_1 == 1 or rev_input_1 == 2 or rev_input_1 == 3
            puts "Please enter a number from the listed options above."
            rev_input_1 = gets.chomp.to_i
            end
        end
    end
end
end

puts bending_check(beam, beam_size, yield_str, modulus, dist_load, span, beam_keys, parameters, loading)