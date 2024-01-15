import Foundation

final class HotelScreenViewModel: ObservableObject {
    
    @Published var hotelModel: HotelModel?
    @Published var images: [String] = []
    
    func getData() {
        APIService.getData(HotelModel.self, url: APIUrls.hotelInfo.url) { result in
            switch result {
                case .success(let data):
                    self.hotelModel = data
                    self.images = data.imageUrls
                case .failure(let error):
                    ErrorHandler.shared.handleError(error: error)
            }
        }
    }
    func formatCurrency(string: Int) -> String {
        return StringFormatter.shared.formatCurrency(string: string)
    }
}
