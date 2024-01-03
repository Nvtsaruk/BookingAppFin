import Foundation

final class PaidViewModel: ObservableObject {
    func getOrderNumber() -> String {
        let orderNumber = Int.random(in: 0..<999999)
        let orderString = "№\(orderNumber)"
        return orderString
    }
}
