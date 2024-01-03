import Foundation

final class HotelScreenViewModel: ObservableObject {
    
    @Published var hotelModel: HotelModel?
    @Published var images: [String] = []
    
    func getData() {
        APIService.getData(HotelModel.self, url: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473") { result in
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
