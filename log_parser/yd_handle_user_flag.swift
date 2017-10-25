import Foundation

class yd_handle_user_flag {
    
    static func handle(flag: User_Flag) throws {

        yd_helper.divider()
        switch flag {
            
            case .Summary:
                for x in specific_logs_arry {
                    x.print_me()
            }
            
            case .Network:
                for x in network_logs_arry {
                    x.print_concise()
            }

            case .Certificates:
                    for x in certificate_logs_array.unique {
                        x.print_concise()
                    }
            
            case .Help:
                yd_helper.help_flags()
            
            case .Count:
                for x in count_logs_arry {
                    count_of_results[x.name] = (count_of_results[x.name] ?? 0) + 1
                }
                
                for (key, value) in count_of_results {
                    consoleIO.write_kvp_message(key, message: String(value), to: .standard)
            }
            
            case .Quit:
                consoleIO.write_message(message: "🔵🐜 Thanks for using LogParser 🐜🔵", to: .standard)
                specific_logs_arry.removeAll()
                network_logs_arry.removeAll()
                certificate_logs_array.removeAll()
                count_logs_arry.removeAll()

            default:
                exit(80)
        }
        yd_helper.divider()
    }
}
