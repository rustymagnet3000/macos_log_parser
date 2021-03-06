enum YD_Cut : Int {
    case    Last_Three = 3
    case    Last_Six = 6
    case    Last_Eighteen = 18
    case    All
}

enum Parsing_Errors : Error {
    case    ErrorReadingUserInput
    case    ErrorDuringAnalysis
    case    NotValidHelperCommand
    case    NotValidFileName
    case    NoOptionSelected
    case    TooShort
    case    TimeError
    case    TimeValueError
    case    ErrorReadingFile
}


enum User_Flag : String {
    case    Waiting_Input
    case    Summary
    case    Network
    case    Certificates
    case    Version
    case    Search
    case    Count
    case    Help
    case    Quit
    case    Unknown
    
    init(flag: String){
        switch flag {
        case "a":
            self = .Summary
        case "c":
            self = .Count
        case "f":
            self = .Certificates
        case "s":
            self = .Search
        case "n":
            self = .Network
        case "h":
            self = .Help
        case "q":
            self = .Quit
        case "v":
            self = .Version
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

