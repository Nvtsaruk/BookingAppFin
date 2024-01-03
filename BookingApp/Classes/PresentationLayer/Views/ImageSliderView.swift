import SwiftUI
struct ImageSliderView: View {
    var imageArray: [String] = []
    @State var currentTabIndex = 0
    var body: some View {
        ZStack() {
            TabView(selection: $currentTabIndex) {
                Spacer().tag(-1) 
                ForEach(0..<(imageArray.count ), id: \.self) { index in
                    VStack {
                        AsyncImage(url: URL(string: imageArray[index] ),
                                   content: { image in
                            image.resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(maxWidth: .infinity, maxHeight: 257)
                        },
                                   placeholder: {
                            ProgressView()
                        })
                    }.tag(index)
                }
                Spacer().tag((imageArray.count ))
            }.tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: currentTabIndex, perform: { _ in
                    if currentTabIndex == (imageArray.count ) {
                        currentTabIndex = 0
                    } else if currentTabIndex == -1 {
                        currentTabIndex = (imageArray.count )-1
                    }
                })
                .frame(height: 257)
            HStack(spacing: 5) {
                ForEach(0..<(imageArray.count ), id: \.self) { index in
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(index == currentTabIndex ? .black : .gray)
                        .onTapGesture {
                            withAnimation {
                                currentTabIndex = index
                            }
                        }
                }
            }.background(
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .fill(Color.white)
                    .frame(width: 20 + CGFloat((imageArray.count )) * 7 + (CGFloat((imageArray.count )) - 1) * 5, height: 17)
            ).padding(.top, 232)
        }
        
    }
}

