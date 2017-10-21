import Foundation
import Cocoa

let consoleIO =  yd_console_IO()

    switch CommandLine.argc {
        case 3:
            let user_inputted_flag = CommandLine.arguments[1]
            let user_inputted_filename = CommandLine.arguments[2]
            user_input_do: do {
                guard user_inputted_flag.check_input(regex_pattern: "^-[adcsv]") else{
                    throw Parsing_Errors.NotValidHelperCommand
                }
                
                guard user_inputted_filename.check_input(regex_pattern: "^[a-z0-9_]{1,20}.txt$") else { throw Parsing_Errors.NotValidHelperCommand
                }
                let user_flag = User_Flag(flag: user_inputted_flag)
                
                switch user_flag {
                    case .Summary:
                        yd_read_file.read_plaintext_log_file(filename: user_inputted_filename)
                        guard var print_flag = yd_helper.get_user_input() else {
                            throw Parsing_Errors.NotValidHelperCommand
                        }
                        print_flag = print_flag.condense_whitespace()
                        
                        if print_flag.isEmpty {
                            print("empty!")
                            throw Parsing_Errors.NoOptionSelected
                        }
                        
                        print("print flag \(print_flag)")
                    case .Count:
                        yd_read_file.read_plaintext_log_file(filename: user_inputted_filename)
                    case .Help:
                        fallthrough
                    default:
                        yd_helper.help()
                }
            }
            catch {
                yd_helper.help()
            }
        
        case 2:
            let user_inputted_flag = CommandLine.arguments[1]
            if user_inputted_flag.check_input(regex_pattern: "^-[adcsv]") == true {
                consoleIO.write_message(message: "enter a file name", to: .standard)
            }
            
            user_flags_do: do {
                guard user_inputted_flag.check_input(regex_pattern: "^-[v]") else{
                    throw Parsing_Errors.NotValidHelperCommand
                }
                yd_helper.version()
            }
            catch {
                yd_helper.help()
            }

        default:
            yd_helper.help()
    }

exit(EXIT_SUCCESS)
