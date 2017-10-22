import Foundation
import Cocoa

class yd_get_user_flag {
    
    static func get() throws -> Character {
        yd_helper.help_flags()
        yd_helper.divider()
        consoleIO.write_message(message: "Enter option:", to: .standard)
        
        guard var user_inputted_flag = readLine() else {
            throw Parsing_Errors.NotValidHelperCommand
        }
        
        guard user_inputted_flag.check_input(regex_pattern: "^[adcsv]") else{
            throw Parsing_Errors.NotValidHelperCommand
        }
        
        user_inputted_flag = user_inputted_flag.condense_whitespace()
        var flag_char: Character = " "
        
        for (i, c) in user_inputted_flag.characters.enumerated() {
            if i == 0 {
                flag_char = c
            }
            if i > 0 {
                throw Parsing_Errors.NotValidHelperCommand
            }
        }
        
        return flag_char
        }
}
