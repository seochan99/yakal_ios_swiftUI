import SwiftUI

struct HomeView: View {
    @State private var currentDate = Date()

    
    
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "YYYY년 MM월 dd일"
           return formatter
       }()
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    
                    HStack{
                        Spacer()
                        Button(action: {
                            // 알림 뷰로 이동하는 코드 여기에 작성
                        }) {
                            Image("icon-bell(1)")
                                .frame(width: 40, height: 40)
                        }
                    }
                    
                    HStack{
                        VStack(alignment: .leading, spacing: 5){
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
                            Text("총0개")
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
                        Spacer()
                    }
                }.padding(.horizontal,20)
                    .background(.white)
                
                Spacer()
                
                
            }.background(Color(red: 0.96, green: 0.96, blue: 0.98))
            }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
