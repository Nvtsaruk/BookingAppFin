import SwiftUI


enum Page: Hashable {
    case hotelScreen
    case hotelRoom(hotelName: String)
    case bookingScreen
    case paidScreen
}

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
            case .hotelScreen:
                HotelScreenView()
            case .hotelRoom(let hotelName):
                HotelRoomScreen(hotelName: hotelName)
            case .bookingScreen:
                BookingScreen()
            case .paidScreen:
                PaidScreen()
        }
    }
}

