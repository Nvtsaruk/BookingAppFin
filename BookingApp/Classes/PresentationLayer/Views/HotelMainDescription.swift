import SwiftUI

struct HotelMainDescription: View {
    var rating: String
    var ratingName: String
    var hotelName: String
    var adress: String
    var minPrice: String
    var priceFor: String
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color.darkOrange)
                            .font(.system(size: 16))
                        Text(rating + " " + ratingName)
                            .foregroundStyle(Color.darkOrange)
                            .font(.system(size: 16, weight: .medium))
                    }.padding(.leading, 10)
                        .padding(.trailing, 10)
                        .padding(.top, 5)
                        .padding(.bottom, 5)
                }
                .background(Color.lightOrange)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                Spacer()
            }
            Text(hotelName)
                .font(.system(size: 22, weight: .medium))
                .padding(.vertical, 8)
            Button {
                
            } label: {
                Text(adress)
                    .font(.system(size: 14, weight: .medium))
            }
            HStack(alignment: .bottom) {
                Text("от \(minPrice)")
                    .font(.system(size: 30, weight: .semibold))
                Text(priceFor.lowercased())
                    .font(.system(size: 16))
                    .foregroundStyle(Color.tagsTextColor)
            }
            .padding(.top)
        }.padding()
    }
}


#Preview {
    HotelMainDescription(rating: "5", ratingName: "Превосходно", hotelName: "Steigenberger Makadi", adress: "Madinat Makadi, Safa Road, Makadi Bay, Египет", minPrice: "134 673", priceFor: "за тур с перелётом")
}
