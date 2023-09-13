import SwiftUI

struct TopSection: View {
    @Binding var currentDate: Date
    
    var body: some View {
        VStack {
            NotificationButton()
            
            InformationSection(currentDate: $currentDate)
        }
        .background(Color.white)
    }
}


struct TopSection_Previews: PreviewProvider {
    @State static private var currentDate = Date()

    static var previews: some View {
        TopSection(currentDate: $currentDate)
    }
}
