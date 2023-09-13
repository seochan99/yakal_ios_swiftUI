import SwiftUI
import Combine

struct DrugInfoResponse: Codable {
    let DrugInfo: DrugInfo
    let Message: String
}

//MARK: - 약 개별 Row
struct MedicationItemRow: View {
    @Binding var medicine: Medicine
    @ObservedObject var viewModel: MedicineViewModel    // viewModel 생성
    
    init(medicine: Binding<Medicine>, isAllCompleted: Bool, isCompleted: Binding<Bool>) {
        _medicine = medicine
        self.isAllCompleted = isAllCompleted
        _isCompleted = isCompleted
        viewModel = MedicineViewModel(medicine: medicine)
    }


    let isAllCompleted: Bool
    @State private var isDetailViewPresented: Bool = false

    @Binding var isCompleted: Bool
    @State private var responseString = "Loading..."

    
    var body: some View {
        HStack(spacing: 16) {
            HStack{
                if let image = viewModel.identaImage {
                    image
                        .resizable()
                        .frame(width: 64, height: 32)
                        .cornerRadius(8)
                } else {
                    ProgressView()  // Show loading spinner
                }
                VStack(alignment: .leading,spacing:2){
                    Text(medicine.name)
                    .font(
                    Font.custom("SUIT", size: 14)
                    .weight(.medium)
                    )
                    .foregroundColor(medicine.atcCode.score == 2 ?  Color(red: 0.88, green: 0.06, blue: 0.16) : Color(red: 0.08, green: 0.08, blue: 0.08))
                    Text(medicine.effect)
                    .font(
                    Font.custom("SUIT", size: 10)
                    .weight(.medium)
                    )
                    .foregroundColor(Color(red: 0.51, green: 0.5, blue: 0.59))
                }
                Spacer()
            }
            .padding(.vertical, 3)
            .onTapGesture {
                isDetailViewPresented = true
            }
            
            
            if medicine.atcCode.score == 0 {
                Image("Green-Light")
                    .resizable()
                    .frame(width: 16, height: 16)
            } else if medicine.atcCode.score == 1 {
                Image("Yellow-Light") // Change to the appropriate image
                    .resizable()
                    .frame(width: 16, height: 16)
            } else if medicine.atcCode.score == 2 {
                Image("Red-Light")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            Button(action: {
                medicine.isTaken.toggle()
                print(medicine.isTaken)
                isCompleted = medicine.isTaken
            }) {
                Image(isAllCompleted ? "Check_disable_end" : (medicine.isTaken ? "Check_disable_ing" : "Check_disable"))
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.horizontal,16)
        .onAppear {
                 viewModel.fetchDrugInfo(kdCode: medicine.kdCode)
             }
          }
    
}


//MARK: - preview
struct MedicationItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        let medicine = Binding<Medicine>(
            get: {
                Medicine(
                    id: 1,
                    image: "image_덱시로펜정",
                    name: "데크시로펜정",
                    effect: "해열, 진통, 소염제",
                    kdCode: "645900210",
                    atcCode: AtcCode(code: "ATC001", score: 1),
                    count: 10,
                    isTaken: false,
                    isOverLap: false
                )

            },
            set: { newValue in }
        )

        MedicationItemRow(
            medicine: medicine, // 바인딩을 직접 전달
            isAllCompleted: false,
            isCompleted: .constant(false) // SwiftUI의 .constant 메서드를 사용
)

        .previewLayout(.sizeThatFits)
        .padding()
    }
}
