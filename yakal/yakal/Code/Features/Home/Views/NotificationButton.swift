import SwiftUI

struct NotificationButton: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                // 알림 뷰로 이동하는 코드 여기에 작성
            }) {
                Image("icon-bell(1)")
                    .frame(width: 40, height: 40)
            }
        }
        .padding(.trailing, 20)
        .background(Color.white)
    }
}

struct NotificationButton_Previews: PreviewProvider {
    static var previews: some View {
        NotificationButton()
    }
}
