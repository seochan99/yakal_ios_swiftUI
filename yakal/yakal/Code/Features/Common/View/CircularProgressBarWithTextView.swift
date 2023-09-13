
import SwiftUI


//MARK: - CircularProgressBarWithText : 원 프로그레스바안에 퍼센트 텍스트
struct CircularProgressBarWithText: View {
    var progress: Double
    var size: CGFloat
    var strokeLineWidth : CGFloat
    var fontSize : CGFloat
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: strokeLineWidth)
                .opacity(0.3)
                .foregroundColor(Color(red: 0.76, green: 0.82, blue: 1))
            Circle()
                .trim(from: 0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: strokeLineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(red: 0.33, green: 0.53, blue: 0.99))
                .rotationEffect(Angle(degrees: -90))
            VStack {
                Text("\(Int(progress * 100))%")
                    .font(Font.custom("SUIT", size: fontSize).weight(.semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(progress == 0 ? Color(red: 0.76, green: 0.82, blue: 1) : Color(red: 0.33, green: 0.53, blue: 0.99))
            }
        }
        .frame(width: size , height: size)
    }
}

struct CircularProgressBarWithText_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarWithText(progress: 0.70,size: 60,strokeLineWidth:3,fontSize:16)
    }
}
