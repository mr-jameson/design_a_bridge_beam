# load_type = ["pedestrian", "truck", "poo"]

# loading = "poo"

# # if loading == load_type[0] or loading == load_type[1] or loading == load_type[2]
# if load_type.include? "wee"  
#     puts true
# else
#     puts false
# end

# def bending_action(dist_load, span)
#     (dist_load * span ** 2) / 8
# end

# puts bending_action(5.0,5.0)

# beam = {
#     "610 UB 125": [0.016, 3.23e-3],
#     "530 UB 92.4": [0.0118, 2.08e-3]
# }

# p beam[:"610 UB 125"][1]

# a = 1
# b = 2

# if a >= b
#     puts true
# else puts false
# end

#hash of beam properties: [XS area(m^2), zy (m^3)]
# parameters = []

# beam = {
#     "610-UB-125": [0.016, 3.23e-3],
#     "530-UB-92.4": [0.0118, 2.08e-3],
#     "460-UB-82.1": [0.0105, 1.61e-3],
#     "410-UB-59.1": [0.00764, 1.06e-3],
#     "360-UB-56.7": [0.00724, 0.899e-3]
# }

# puts "What size beam do you want to use?"

# beam_keys = beam.keys
# puts beam_keys

# def get_beam_size(beam_keys, parameters)
# beam_size = gets.chomp.to_sym
# #Make sure user enters a value from the beam array
#     until beam_keys.include? beam_size
#         puts "Please enter a beam specification from the list above."
#         beam_size = gets.chomp.to_sym
#     end 
# parameters.push "beam_size = #{beam_size}"
# puts parameters
# end

# puts get_beam_size(beam_keys, parameters)

# def bending_check(beam, beam_size, yield_str, modulus, dist_load, span, beam_keys, parameters)
#     if bending_capacity(yield_str, modulus) >= bending_action(dist_load, span)
#         puts "\n Beam size is adequate in bending."
#     else 
#         puts "\n This beam is not strong enough. Please select a larger beam, reduce your span, or reduce your load. What would you like to do?"
#         sleep (1)
#         puts "\n 1. Select a larger beam
#         \n 2. Reduce span
#         \n 3. Reduce load \n"
#         rev_input_1 = gets.chomp.to_i
#         if rev_input_1 == 1
#             system("clear")
#             beam_size = get_beam_size(beam_keys, parameters)
#             puts "New beam size = #{beam_size}"
#             while bending_capacity(yield_str, modulus) <= bending_action(dist_load, span)
#                 puts "Beam is still not strong enough. Please select a larger beam, reduce your span, or reduce your load. What would you like to do?"
#                     beam_size = get_beam_size(beam_keys, parameters)
#                     puts "New beam size = #{beam_size}"
#                 end
#         elsif rev_input_1 == 2
#             puts "Implement reduce_span method"
#         elsif rev_input_1 == 3
#             puts "Implement reduce_load method"
#         else
#             until rev_input_1 == 1 or rev_input_1 == 2 or rev_input_1 == 3
#             puts "Please enter a number from the listed options above."
#             end
#         end
#     end
# end

# puts bending_check(beam, beam_size, yield_str, modulus, dist_load, span, beam_keys, parameters)

# parameters = [
#     "span = 5 m",
#     "beam_size = 600",
#     "load = rail"
# ]

    

# # initial_beam_size = parameters.grep(/beam_size/)

# if parameters.to_s.include? "beam_size"
#     parameters.delete_at(1)
#     parameters.insert(1,"beam_size = 700")
# else
#     parameters.push "beam size = 700"
# end

# p parameters
# # p initial_beam_size

# #----------------------------------------------------------------------------------------------------------

# #Get span input from user
# puts "What is the span of your bridge in meters?"

# span = gets.chomp.to_f

# #Make sure user enters a float or an integer, not a string or an array
# while span == 0
#     puts "Please input an integer or a float."
#     span = gets.chomp.to_f
# end 

# #Add delay for better UI
# sleep(1)

# #clear screen
# system("clear")

# parameters.push "span = #{span} m"
# puts parameters
# puts "\n"

# #----------------------------------------------------------------------------------------------------------
# parameters = []

# puts "What is the span of your bridge in meters?"

# def get_span(parameters)
# span = gets.chomp.to_f

# #Make sure user enters a float or an integer, not a string or an array
#     while span == 0
#         puts "Please input an integer or a float."
#         span = gets.chomp.to_f
#     end 

#     parameters.push "span = #{span} m"
#     puts parameters
#     puts "\n"
#     return span
# end

# span = get_span(parameters)

#Get span input from user
# parameters = ["span = 1"]
# puts "\nWhat is the span of your bridge in meters?"

# def get_span(parameters)
#     span = gets.chomp.to_f
#         #Make sure user enters a float or an integer, not a string or an array
#         while span == 0
#             puts "Please input an integer or a float."
#             span = gets.chomp.to_f
#         end 

#         if parameters.to_s.include? "span"
#             parameters.delete_at(0)
#             parameters.unshift "span = #{span} m"
#         else
#             parameters.push "span = #{span} m"
#         end
#         return span
# end
    
# span = get_span(parameters)

# puts parameters


#Get load type input from user. The user selects the load type from a pre-determined list/array
# puts parameters
# puts "\nWhat kind of load will the bridge carry?"

# load_type = ["pedestrian", "road", "rail"]

# puts "#{load_type[0].capitalize}, #{load_type[1]}, or #{load_type[2]}?"
# # for load in load_type
# #     if load_type.find_index(load) == load_type.length - 1
# #     puts "or #{load}?"
# #     else puts "#{load},"
# #     end
# # end

# loading = gets.chomp

# #Make sure user enters a value from the load_type array
# loading = loading.downcase
# until load_type.include? loading
#     puts "Please enter a load type from the list above."
#     loading = gets.chomp
#     loading = loading.downcase
# end 


# # #Add delay for better UI
# sleep(1)

# # #clear screen
# system("clear")

# parameters.push "load_type = #{loading}"
# puts parameters
# puts "\n"

# # Assign distributed load value in kN/m to load type
# if loading == "pedestrian"
#     dist_load = 5
# elsif loading == "road"
#     dist_load = 20
# else loading == "rail"
#     dist_load = 25
# end


# parameters = []

# puts "\nWhat kind of load will the bridge carry?"

# def get_load_type(parameters)
#     load_type = ["pedestrian", "road", "rail"]
#         puts "#{load_type[0].capitalize}, #{load_type[1]}, or #{load_type[2]}?"

#     loading = gets.chomp
#     #Make sure user enters a value from the load_type array
#     loading = loading.downcase

#     until load_type.include? loading
#         puts "Please enter a load type from the list above."
#         loading = gets.chomp
#         loading = loading.downcase
#     end 

#     if parameters.to_s.include? "load_type"
#         parameters.delete_at(1)
#         parameters.insert(1,"load_type = #{loading}")
#     else
#         parameters.push "load_type = #{loading}"
#     end

#     # Assign distributed load value in kN/m to load type
#     if loading == "pedestrian"
#         dist_load = 5
#     elsif loading == "road"
#         dist_load = 20
#     else loading == "rail"
#         dist_load = 25
#     end
#     return dist_load
# end

# dist_load = get_load_type(parameters)

# puts parameters 

# require "colorize"
# require "rubocop"
# require "crayon"
# require "artii"

# puts Crayon.bold("This will be bold")
# puts Crayon.blue("This will be blue but not bold")

# a = Artii::Base.new 
# puts a.asciify('GOOD   JOB!')

# puts String.colors

argv_copy = ARGV.map{|i| i}
ARGV.clear
p argv_copy
name = gets.chomp