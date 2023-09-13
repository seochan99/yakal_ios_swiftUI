import SwiftUI

struct InformationSection: View {
    @Binding var currentDate: Date
    
    private let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "YYYY년 MM월 dd일"
           return formatter
       }()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(dateFormatter.string(from: currentDate))
                    .font(
                        Font.custom("SUIT", size: 15)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.45))
                    .padding(.bottom,10)
                Text("오늘 복용해야하는 약은\n")
                    .font(Font.custom("SUIT", size: 20).weight(.medium))
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08)) +
                Text("총 0개")
                    .font(Font.custom("SUIT", size: 20).weight(.medium))
                    .foregroundColor(Color(UIColor(red: 0.15, green: 0.4, blue: 0.96, alpha: 1))) +
                Text("입니다")
                    .font(Font.custom("SUIT", size: 20).weight(.medium))
                    .foregroundColor(Color(red: 0.08, green: 0.08, blue: 0.08))
                
                // CalendarView
                NavigationLink(destination: CalendarView()) {
                    HStack{
                        Image("icon_celedar")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("다른 날짜 복약정보")
                            .font(
                                Font.custom("SUIT", size: 16)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.45))
                    }
                }.foregroundColor(.clear)
                    .padding(.horizontal,14)
                    .padding(.vertical,6)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.98))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.91, green: 0.91, blue: 0.93), lineWidth: 1)
                    )
                    .padding(.top,36)
                    .padding(.bottom,24)
            }
            .padding(.leading,20)
            Spacer()
            VStack(spacing:24){
                CircularProgressBarWithText(progress: 0.3,size:88,strokeLineWidth:5,fontSize:20)
                                    Spacer()
                                            .frame(height: 30)
                
            }
            .padding(.trailing,20)
        }.background(.white)
    }
}

struct InformationSection_Previews: PreviewProvider {
    @State static private var currentDate = Date()

    static var previews: some View {
        InformationSection(currentDate: $currentDate)
    }
}

