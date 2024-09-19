import SwiftUI

struct TikokuRankingView: View {
    @State var timerHandler: Timer?
    @State private var selectedIndex: Int = 0
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(height: 328)
                    .foregroundColor(.darkred)
                VStack {
                    Text("残り時間")
                        .font(.title2)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    Text("00:00:00")
                    
                        .font(.custom("", size: 100))
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(width: 377, height: 30)
                        .foregroundColor(.lightgray)
                        .cornerRadius(15)
                        .padding(.bottom)
                    Rectangle()
                        .frame(width: 377, height: 30)
                        .foregroundColor(.lightgray)
                        .cornerRadius(15)
                }
            }
            .padding(.bottom)
            TextSegmentedControl()
            ScrollView {
                RankingUserCard(rankState: .first)
                RankingUserCard(rankState: .secound)
                RankingUserCard(rankState: .third)
                RankingUserCard(rankState: .normal)
            }
            Spacer()
        }
    }
}

struct TextSegmentedControl: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<2) { index in
                Text(index == 0 ? "到着者" : "ランキング")  // テキストに変更
                    .font(index == 0 ? .system(size: 24) : .system(size: 24))
                    .fontWeight(.bold)
                    .frame(width: 115)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 30)
                    .background(self.selectedIndex == index ? Color.darkred : Color.lightgray)
                    .foregroundColor(self.selectedIndex == index ? Color.white : Color.black)
                    .clipShape(
                        index == 0
                            ? RoundedCornerShape(corners: [.topLeft, .bottomLeft], radius: 40)
                            : RoundedCornerShape(corners: [.topRight, .bottomRight], radius: 40)
                    )
                    .onTapGesture {
                        self.selectedIndex = index
                    }
            }
        }
    }
}

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect, byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
