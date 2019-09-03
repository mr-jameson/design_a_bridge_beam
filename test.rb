load_type = ["pedestrian", "truck", "poo"]

loading = "poo"

# if loading == load_type[0] or loading == load_type[1] or loading == load_type[2]
if load_type.include? "wee"  
    puts true
else
    puts false
end

