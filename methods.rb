# Elliot Jameson CAS021906
# Terminal Application
# Reference methods

#get_span method gets input from the user about the span length. Only an integer or a float.
def get_span(parameters)
    span = gets.chomp.to_f
        #Make sure user enters a float or an integer, not a string or an array
        while span == 0
            puts "Please input an integer or a float.".colorize(:light_red)
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

#-----------------------------------------------------------------------------------------------------------------------

#get_load_type method asks user for load-type input. Only accepts strings which are in load_type array.
def get_load_type(parameters)
    load_type = ["pedestrian", "road", "rail"]
        puts "#{load_type[0].capitalize}, #{load_type[1]}, or #{load_type[2]}?"

    loading = gets.chomp
    #Make sure user enters a value from the load_type array
    loading = loading.downcase

    until load_type.include? loading
        puts "Please enter a load type from the list above.".colorize(:light_red)
        loading = gets.chomp
        loading = loading.downcase
    end 

    if parameters.to_s.include? "load_type"
        parameters.delete_at(1)
        parameters.insert(1,"load_type = #{loading}")
    else
        parameters.push "load_type = #{loading}"
    end

    # Assign distributed load value in kN/m to load type
    if loading == "pedestrian"
        dist_load = 5
    elsif loading == "road"
        dist_load = 20
    else loading == "rail"
        dist_load = 25
    end
    return dist_load
end