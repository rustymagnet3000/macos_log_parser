import Foundation
import Cocoa

extension String {
    func check_input(regex_pattern: String) -> Bool {
        do {
            let regex = try! NSRegularExpression(pattern: regex_pattern,
                                                 options: [.caseInsensitive])
            return regex.firstMatch(in: self, options:[], range: NSMakeRange(0, utf16.count)) != nil
        }
    }
}

let consoleIO =  yd_console_IO()

    switch CommandLine.argc {
        case 3:
            let user_inputted_flag = CommandLine.arguments[1]
            let user_inputted_filename = CommandLine.arguments[2]
            user_input_do: do {
                guard user_inputted_flag.check_input(regex_pattern: "^-[a]") else{
                    throw Parsing_Errors.NotValidHelperCommand
                }
                
                guard user_inputted_filename.check_input(regex_pattern: "^[a-z0-9]{1,20}.txt$") else { throw Parsing_Errors.NotValidHelperCommand
                }
                
                yd_file_parser.read_plaintext_log_file(filename: user_inputted_filename)
                
            }
            catch {
                yd_helper.help()
            }
        
        case 2:
            let user_inputted_flag = CommandLine.arguments[1]
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
