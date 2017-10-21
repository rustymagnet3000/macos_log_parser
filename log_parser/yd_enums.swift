enum YD_Cut : Int {
    case    Last_Three = 3
    case    Last_Six = 6
    case    Last_Eighteen = 18
    case    All
}

enum Parsing_Errors : Error {
    case    NotValidHelperCommand
    case    NoOptionSelected
    case    TooShort
    case    TimeError
    case    TimeValueError
    case    CannotReadFile
}


enum User_Flag : String {
    case    Summary
    case    Count
    case    Help
    case    Unknown
    
    init(flag: String){
        switch flag {
        case "-a":
            self = .Summary
        case "-c":
            self = .Count
        case "-h":
            self = .Help
        default:
            self = .Unknown
        }
    }
}

enum HTTP_Result_Status : String {
    case    HTTP_Success
    case    HTTP_Failure
    case    HTTP_Server_Error
    case    HTTP_Server_Rejected
    case    HTTP_Result_Unhandled
    
    init(result: String){
        
        switch result {
        case "200":
            self = .HTTP_Success
        case "201":
            self = .HTTP_Success
        case "403":
            self = .HTTP_Server_Rejected
        case "500":
            self = .HTTP_Server_Error
        default:
            self = .HTTP_Result_Unhandled
        }
    }
}

