import SwiftUI

struct TourInfoView: View {
    let departure: String
    let arrival: String
    let tourStart:String
    let tourEnd: String
    let numNights: String
    let hotelName: String
    let room: String
    let nutrition: String
    var body: some View {
        Group {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(150)), GridItem(.flexible())
                ],
                alignment: .leading,
                spacing: 10,
                content: {
                    Text("Вылет из")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(departure)
                    Text("Страна, город")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(arrival)
                    Text("Даты")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(tourStart + "-" + tourEnd)
                    Text("Кол-во ночей")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(numNights)
                    VStack {
                        Text("Отель")
                            .foregroundStyle(Color.tagsTextColor)
                        Spacer()
                    }
                    Text(hotelName)
                    VStack {
                        Text("Номер")
                            .foregroundStyle(Color.tagsTextColor)
                        Spacer()
                    }
                    Text(room)
                    Text("Питание")
                        .foregroundStyle(Color.tagsTextColor)
                    Text(nutrition)
                })
            .font(.system(size: 16))
            .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    TourInfoView(departure: "Санкт-Петербург", arrival: "Египет, Хургада", tourStart: "19.09.2023", tourEnd: "27.09.2023", numNights: "7 ночей", hotelName: "Steigenberger Makadi", room: "Стандартный с видом на бассейн или сад", nutrition: "Все включено")
}
