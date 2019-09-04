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
parameters = []

beam = {
    "610-UB-125": [0.016, 3.23e-3],
    "530-UB-92.4": [0.0118, 2.08e-3],
    "460-UB-82.1": [0.0105, 1.61e-3],
    "410-UB-59.1": [0.00764, 1.06e-3],
    "360-UB-56.7": [0.00724, 0.899e-3]
}

puts "What size beam do you want to use?"

beam_keys = beam.keys
puts beam_keys

def get_beam_size(beam_keys, parameters)
beam_size = gets.chomp.to_sym
#Make sure user enters a value from the beam array
    until beam_keys.include? beam_size
        puts "Please enter a beam specification from the list above."
        beam_size = gets.chomp.to_sym
    end 
parameters.push "beam_size = #{beam_size}"
puts parameters
end

puts get_beam_size(beam_keys, parameters)