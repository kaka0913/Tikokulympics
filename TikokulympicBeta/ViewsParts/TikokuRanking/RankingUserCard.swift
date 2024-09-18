import SwiftUI

struct RankingUserCard: View {
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: 377,height: 78)
                .foregroundColor(.lightgray)
                .cornerRadius(15)
                .padding(.top)
            Rectangle()
                .frame(width: 150,height: 78)
                .foregroundColor(Color.longDistance)
                .clipShape(RoundedCornerShape(corners: [.topLeft, .bottomLeft], radius: 15))
                .padding(.top)
            
            HStack( spacing:0){
                ZStack{
                    Image("Explosion")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 58, height: 58)
                        .padding(.top)
                    Text("1st")
                        .padding(.top)
                        .fontWeight(.bold)
                        .font(.system(size:25))
                    
                }
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 58, height: 58, alignment:.leading)
                    .padding(.top)
                    .padding(.leading,5)
                VStack(alignment: .leading){
                    Text("名前")
                        .font(.headline)
                        .padding(.leading,5)
                        .padding(.bottom, 3)
                        .lineLimit(1)
                    Text("称号")
                        .font(.headline)
                        .padding(.leading,5)
                }
                .padding(.top)
                Spacer()
                Text("40km")
                    .font(.system(size: 20))
                    .padding(.top, 60)
                    .padding(.trailing, 30)
                
            }
            
        }
    }
}
