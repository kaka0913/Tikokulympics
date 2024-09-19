import SwiftUI
import Combine

class LimitTimeViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 0
    private var cancellablePipeLine: AnyCancellable?
    var meetingTime: Date

    init(meetingTime: Date = Calendar.current.date(byAdding: .minute, value: 10, to: Date()) ?? Date()) {
        self.meetingTime = meetingTime
        cancellablePipeLine = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                let currentDate = Date()
                self.remainingTime = self.culcLimitTime(meetingTime: self.meetingTime, currentDate: currentDate)
            }
    }

    func culcLimitTime(meetingTime: Date, currentDate: Date) -> TimeInterval {
        return max(meetingTime.timeIntervalSince(currentDate), 0)
    }
}
struct LimitTime: View {
    @Binding var limitTime: Double
    var body: some View {
        VStack {
            Text("残り時間")
                .font(.title2)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Text(formattedTime(remainingTime: limitTime))
                .font(.custom("", size: 100))
                .foregroundColor(.white)
        }
    }
    func formattedTime(remainingTime: TimeInterval) -> String {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
