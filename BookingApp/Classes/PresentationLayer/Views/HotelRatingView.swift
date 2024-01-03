import SwiftUI

struct HotelRatingView: View {
    let rating: String
    let ratingName: String
    var body: some View {
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
    }
}

#Preview {
    HotelRatingView(rating: "5", ratingName: "Превосходно")
}
