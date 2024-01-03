import SwiftUI
import WrappingHStack

struct AboutHotel: View {
    
    struct ListModel: Identifiable {
        var id = UUID()
        var icon: String
        var name: String
        var description: String
    }
    
    let list = [ListModel(icon: "emoji-happy", name: "Удобства", description: "Самое необходимое"),
                ListModel(icon: "tick-square", name: "Что включено", description: "Самое необходимое"),
                ListModel(icon: "close-square", name: "Что не включено", description: "Самое необходимое")
    ]
    
    var peculiarities: [String]
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
                .padding()
            WrappingHStack(alignment: .leading) {
                ForEach(0..<(peculiarities.count ), id: \.self) { index in
                    HStack {
                        Text(peculiarities[index])
                            .foregroundStyle(Color.tagsTextColor)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .font(.system(size: 16, weight: .medium))
                    }.background(Color.tagsBackgroundColor)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }.padding(.horizontal)
            
            Text(description)
                .font(.system(size: 16, weight: .regular))
                .padding(.horizontal)
                .padding(.top, 12)
            VStack {
                ForEach(list) { item in
                    HStack {
                        Image(item.icon)
                        VStack {
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.system(size: 16, weight: .medium))
                                    Text(item.description)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundStyle(Color.tagsTextColor)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                            Divider()
                        }
                        
                    }.padding()
                }
            }
            .background(Color.tagsBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.top, 16)
            .padding(.horizontal)
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


#Preview {
    AboutHotel(peculiarities: ["3-я линия", "test"], description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!")
}
