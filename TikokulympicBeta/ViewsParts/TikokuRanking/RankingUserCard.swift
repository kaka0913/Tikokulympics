import SwiftUI

struct RankingUserCard: View {
    @State var name: String = "名前"
    @State var title: String = "称号"
    @State var distance: String = "40"
    var rankState: Rank
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 377, height: 78)
                .foregroundColor(.lightgray)
                .cornerRadius(15)
                .padding(.top)
                .padding(.leading,8)
            Rectangle()
                .frame(width: 150, height: 78)
                .foregroundColor(Color.longDistance)
                .clipShape(RoundedCornerShape(corners: [.topLeft, .bottomLeft], radius: 15))
                .padding(.top)
                .padding(.leading,8)
            
            HStack(spacing: 0) {
                ZStack {
                    switch rankState {
                    case .first:
                        Image("Explosion")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.top)
                        Text("1st")
                            .padding(.top)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    case .secound:
                        Image("RedBomb")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.top)
                        Text("2nd")
                            .padding(.top, 28)
                            .padding(.trailing,4)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    case .third:
                        Image("BlackBomb")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.top)
                        Text("3rd")
                            .padding(.top,28)
                            .padding(.trailing,4)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    case .normal:
                        Text("5th")
                            .padding(.top,28)
                            .padding(.leading,10)
                            .padding(.trailing,20)
                            .fontWeight(.bold)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading,10)
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 58, height: 58, alignment: .leading)
                    .padding(.top)
                    .padding(.leading, 5)
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                        .padding(.leading, 5)
                        .padding(.bottom, 3)
                        .lineLimit(1)
                    Text(title)
                        .font(.headline)
                        .padding(.leading, 5)
                }
                .padding(.top)
                Spacer()
                Text("\(distance)km")
                    .font(.system(size: 20))
                    .padding(.top, 60)
                    .padding(.trailing, 30)
            }
            
        }
    }
}

#Preview {
    RankingUserCard(rankState: .normal)
}

