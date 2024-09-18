import SwiftUI

struct MeetingTimeInformation: View {
    var body: some View {
        @State var meetingtime: String = "10:00"
        ZStack{
            Rectangle()
                .frame(width: 377, height: 30)
                .foregroundColor(.lightgray)
                .cornerRadius(15)
                .padding(.bottom)
            HStack{
                Text("集合時間")
                    .font(.title2)
                    .padding(.bottom)
                
                Text(meetingtime)
                    .font(.title2)
                    .padding(.bottom)
            }
        }
    }
}
