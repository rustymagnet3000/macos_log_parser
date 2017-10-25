import Foundation
import Cocoa

class yd_get_user_flag {
    
    static func get() throws -> User_Flag {
        yd_helper.divider()
        consoleIO.write_message(message: "Enter option:", to: .standard)
        
        guard var user_inputted_flag = readLine() else {
            throw Parsing_Errors.ErrorReadingUserInput
        }
        
        guard user_inputted_flag.check_input(regex_pattern: "^[adnhfqcsv]") else{
            throw Parsing_Errors.NotValidHelperCommand
        }
        
        user_inputted_flag = user_inputted_flag.condense_whitespace()

        let flag_enum = User_Flag(flag: user_inputted_flag)
        
        guard flag_enum != .Unknown else {
            throw Parsing_Errors.NotValidHelperCommand
        }
        
        return flag_enum
    }
}
