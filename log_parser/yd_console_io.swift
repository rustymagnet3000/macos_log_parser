import Foundation

enum OutputType {
    case error
    case standard
}

class yd_console_IO {

    func write_kvp_message(_ label: String, result: Bool, cutting: String, to: OutputType = .standard) {
        
        switch to {
        case .standard:
            switch (label.characters.count){
            case Int.min..<15:
                print("\(label)\t\t\t\t\t\(result)\t\t\(cutting)")
            case Int.min..<22:
                print("\(label)\t\t\t\t\(result)\t\t\(cutting)")
            case Int.min..<35:
                print("\(label)\t\t\t\(result)\t\t\(cutting)")
            default:
                print("\(label)\t\t\t\(result)\t\t\(cutting)")
            }
            
        case .error:
            fputs("Error: \(label)\n", stderr)
        }
    }
    
    func write_kvp_message(_ label: String, message: String, to: OutputType = .standard) {

        switch to {
        case .standard:
            switch (label.characters.count){
            case Int.min..<15:
                print("\(label)\t\t\t\t\t\(message)")
            case Int.min..<22:
                print("\(label)\t\t\t\t\(message)")
            case Int.min..<35:
                print("\(label)\t\t\t\(message)")
            default:
                print("\(label)\t\t\t\(message)")
            }
           
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func write_message(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
}