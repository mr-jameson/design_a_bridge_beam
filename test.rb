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

parameters = [
    "span = 5 m",
    "beam_size = 600",
    "load = rail"
]

    

# initial_beam_size = parameters.grep(/beam_size/)

if parameters.to_s.include? "beam_size"
    parameters.delete_at(1)
    parameters.insert(1,"beam_size = 700")
else
    parameters.push "beam size = 700"
end

p parameters
# p initial_beam_size