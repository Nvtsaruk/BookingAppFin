import SwiftUI

struct HotelInfoView: View {
    var rating: String
    var ratingName: String
    var hotelName: String
    var HotelAdress: String
    var body: some View {
        Group{
            VStack(alignment: .leading) {
                HStack {
                    HotelRatingView(rating: rating, ratingName: ratingName)
                    Spacer()
                }
                Text(hotelName)
                    .font(.system(size: 22, weight: .medium))
                    .padding(.vertical, 8)
                Button {
                    
                } label: {
                    Text(HotelAdress)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    HotelInfoView(rating: "5", ratingName: "Превосходно", hotelName: "Steigenberger Makadi", HotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет")
}
