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

#-------------------------------------------------------------------------------------------------------------------------
#Method for calculating max sagging bending moment in kNm

def bending_action(dist_load, span)
    (dist_load * span ** 2) / 8
end

#----------------------------------------------------------------------------------------------------------------------
# Define a method to get the user to input the beam size.

def get_beam_size(beam_keys, parameters)
    puts beam_keys
    puts "\n"
    beam_size = gets.chomp.to_sym
#Make sure user enters a value from the beam array
    until beam_keys.include? beam_size
        puts "Please enter a beam specification from the list above.".colorize(:light_red)
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

#-------------------------------------------------------------------------------------------------------------------------
#Define method for outputing bending capacity of beam in kNm
def bending_capacity(yield_str, beam_size, beam)
    yield_str * 1e6 * beam[beam_size][1] / 1000
end

#--------------------------------------------------------------------------------------------------------------------------
#Loop method for checking adequacy of beam
def bending_check(beam, beam_size, yield_str, dist_load, span, beam_keys, parameters, loading)
    while bending_capacity(yield_str, beam_size, beam) > bending_action(dist_load, span)
        puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the specified load.".colorize(:light_green)
        #Add delay for better UI
        
         sleep (1)

         puts "Do you want to try a lighter beam? Yes or no."
         optimise = gets.chomp

         #Make sure user enters a yes or no value
         optimise = optimise.downcase
        until optimise == "yes" or optimise == "no"
            puts "Please answer yes or no.".colorize(:light_red)
            optimise = gets.chomp
            optimise = optimise.downcase
        end 
        #Add delay for better UI
        sleep(1)

        #Clear screen
        system("clear")

        if optimise == "yes"
            puts "\nChoose a new " + Crayon.underline("beam size") + " for your bridge:"
            beam_size = get_beam_size(beam_keys, parameters)

            system("clear")
            sleep(1)

            puts parameters
        else
            puts "Here is a summary of your bridge design:\n\n"
            puts parameters
            sleep(1)
            puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the specified load.".colorize(:light_green)
            a = Artii::Base.new 
           puts a.asciify('GOOD   JOB!')
           exit
        end
    end
        while bending_capacity(yield_str, beam_size, beam) <= bending_action(dist_load, span)
            system("clear")
            puts parameters
            puts "\nThe #{beam_size} beam is not strong enough given the span and load. Please select a larger beam, reduce your span, or reduce your load. \nWhat would you like to do?".colorize(:light_red)
            puts "\n 1. Update the beam size
            \n 2. Update the span
            \n 3. Update the load
            \nEnter a number from the options above.\n"
            rev_input_1 = gets.chomp.to_i
            if rev_input_1 == 1
                system("clear")
                puts parameters
                puts "\nWhat size " + Crayon.underline("beam") + " do you want to update to?"
                beam_size = get_beam_size(beam_keys, parameters)
            elsif rev_input_1 == 2
                system("clear")
                puts parameters
                puts "\nWhat do you want to update the " + Crayon.underline("span") + " to? (in meters)"
                span = get_span(parameters)
            elsif rev_input_1 == 3
                system("clear")
                puts parameters
                puts "\nWhat do you want to update the " + Crayon.underline("load type") + " to?"
                dist_load = get_load_type(parameters)
            else
                until rev_input_1 == 1 or rev_input_1 == 2 or rev_input_1 == 3
                puts "Please enter a number from the listed options above.".colorize(:light_red)
                rev_input_1 = gets.chomp.to_i
                end
            end
        end
        while bending_capacity(yield_str, beam_size, beam) > bending_action(dist_load, span)
            puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the specified load.".colorize(:light_green)
            #Add delay for better UI
            
             sleep (1)
    
             puts "Do you want to try a lighter beam? Yes or no."
             optimise = gets.chomp
    
             #Make sure user enters a yes or no value
             optimise = optimise.downcase
            until optimise == "yes" or optimise == "no"
                puts "Please answer yes or no.".colorize(:light_red)
                optimise = gets.chomp
                optimise = optimise.downcase
            end 
            #Add delay for better UI
            sleep(1)
    
            #Clear screen
            system("clear")
    
            if optimise == "yes"
                puts parameters
                puts "\nChoose a new " + Crayon.underline("beam size") + " for your bridge:"
                beam_size = get_beam_size(beam_keys, parameters)
    
                system("clear")
                sleep(1)
    
                puts parameters
            else
                puts "Here is a summary of your bridge design:\n\n"
                puts parameters
                sleep(1)
                puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the specified load.".colorize(:light_green)
                sleep (1)
                a = Artii::Base.new 
               puts a.asciify('GOOD   JOB!')
               exit
            end
        end
            puts "\nThe #{beam_size} beam is adequate. A #{span} m span bridge can safely carry the specified load.".colorize(:light_green)
             sleep (1)
             a = Artii::Base.new 
            puts a.asciify('GOOD   JOB!')
end
