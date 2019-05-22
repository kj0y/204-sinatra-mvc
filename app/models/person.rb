class Person < ActiveRecord::Base


    #Determine birth path number
    def self.calc_birthpath_num(birthdate)
        birthdate_sum = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
        birthday_string = birthdate_sum.to_s
        #Assign the return value to a variable
        birthday_number = birthday_string[0].to_i + birthday_string[1].to_i

        if (birthday_number > 9)
            birthday_string = birthday_number.to_s
            #Assign the return value to a variable
            birthday_number = birthday_string[0].to_i + birthday_string[1].to_i
        end

        return birthday_number
    end

    #Create a method that determines what message to display
    def self.get_message(birthday_number)
        case birthday_number
            #Assign the return value to a variable
            when 1
                @message = "One is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
            when 2
                @message = "This is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
            when 3
                @message = "Number Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
            when 4
                @message = "This is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
            when 5
                @message = "This is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
            when 6
                @message = "This is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
            when 7
                @message = "This is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
            when 8
                @message = "This is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
            when 9
                @message = "This is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
            else @message = "I don't have any answers for you!"
        end
    end

    #Validate user input of birthdate
    def self.valid_birthdate(input)
        if input.length == 8 && input.match(/^[0-9]+[0-9]$/)
            return true
        else
            return false
        end
    end

end
