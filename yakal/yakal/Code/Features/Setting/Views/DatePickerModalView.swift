import SwiftUI

struct DatePickerModalView: View {
    @Binding var isPresented: Bool
    @Binding var date: Date

    var body: some View {
        VStack {
            DatePicker("시간 설정", selection: $date, displayedComponents: .hourAndMinute)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
                .padding()
            
            BlueHorizontalButton(text: "Set Time") {
                isPresented = false
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

