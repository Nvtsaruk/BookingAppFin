import Foundation
final class StringFormatter {
    static let shared = StringFormatter()
    
    private init() {}
    
    private let hourDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "HH"
        return df
    }()
    
    private let dateFormat: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d/M/yyyy"
        return dateFormatter
    }()
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    func dateChecker(dateToCheck: String) -> Bool {
        let df = dateFormat
        if df.date(from: dateToCheck) != nil {
            return true
        }
        else {
            return false
        }
    }
        
    func formatCurrency(string: Int) -> String {
        if let formattedString = currencyFormatter.string(from: string as NSNumber) {
            return String(formattedString)
        }
        return ""
    }
}
