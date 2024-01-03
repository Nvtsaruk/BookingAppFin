import Foundation

struct TouristModel {
    var name: String
    var surname: String
    var birth: String
    var citizenship: String
    var passportNumber: String
    var passportValidityPeriod: String
}

final class BookingScreenViewModel: ObservableObject {
    
    @Published var bookingModel: BookingModel?
    
    @Published var validationArray: [[String:Bool]] = []
    
    @Published var touristsArray: [TouristModel] = []
    
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var phoneValidation: Bool = true
    @Published var emailValidation: Bool = true
    
    var validationDict = ["nameValidation":true,
                          "surnameValidation": true,
                          "birthValidation": true,
                          "citizenshipValidation": true,
                          "passportNumberValidation": true,
                          "passportValidityPeriodValidation": true]
    
    func getData() {
        APIService.getData(BookingModel.self, url: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff") { result in
            switch result {
                case .success(let data):
                    self.bookingModel = data
                case .failure(let error):
                    ErrorHandler.shared.handleError(error: error)
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }
    
    func isValid(name: String) -> Bool {
        let regex = "[А-Яа-яA-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: name)
        
        return result
    }
    
    func isValidDate(dateToCheck: String) -> Bool {
        return StringFormatter.shared.dateChecker(dateToCheck: dateToCheck)
    }
    
    func getResultPrice() -> String {
        let fullPrice = (bookingModel?.tourPrice ?? 0) + (bookingModel?.fuelCharge ?? 0) + (bookingModel?.serviceCharge ?? 0)
        let resultString = formatCurrency(string: fullPrice)
        return resultString
    }
    
    func formatCurrency(string: Int) -> String {
        return StringFormatter.shared.formatCurrency(string: string)
    }
    
    func addValidation() {
        validationArray.append(validationDict)
        touristsArray.append(TouristModel(name: "", surname: "", birth: "", citizenship: "", passportNumber: "", passportValidityPeriod: ""))
    }
    
    func setValidity(index: Int, key: String, value: Bool) {
        validationArray[index][key] = value
    }
    
    func checkValidation(index: Int, key: String) -> Bool {
        guard let result = validationArray[index][key] else { return false}
        return result
    }
    
    func getAllValidation() -> Bool {
        var sum = 0
        if phone.count < 18 {
            sum += 1
            phoneValidation = false
        }
        if !isValidEmail(email) {
            sum += 1
            emailValidation = false
        }
        touristsArray.forEach{ tourist in
            let mirror = Mirror(reflecting: tourist)
            for child in mirror.children  {
                if child.value as! String == "" {
                    sum += 1
                }
            }
        }
        validationArray.forEach{ dict in
            for (key, value) in dict {
                if value == false {
                    sum += 1
                }
            }
        }
        
        if sum > 0 {
            return false
        } else {
            return true
        }
    }
}

