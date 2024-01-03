import SwiftUI

struct TourSummaryView: View {
    var tourPrice: String
    var fuelCharge: String
    var serviceCharge: String
    var summ: String
    var body: some View {
        Group {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(150), alignment: .leading), GridItem(.flexible(), alignment: .trailing)
                ],
                spacing: 10,
                content: {
                    Text("Тур")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(tourPrice)
                    Text("Топливный сбор")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(fuelCharge)
                    Text("Сервисный сбор")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(serviceCharge)
                    Text("К оплате")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(summ)
                        .fontWeight(.semibold)
                        .foregroundStyle(.blue)
                })
            .font(.system(size: 16))
            .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    TourSummaryView(tourPrice: "186600", fuelCharge: "9300", serviceCharge: "2150", summ: "123123")
}
