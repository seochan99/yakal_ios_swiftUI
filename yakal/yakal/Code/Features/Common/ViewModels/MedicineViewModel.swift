
import SwiftUI
import Combine

class MedicineViewModel: ObservableObject {
    @Published var identaImage: Image?
    @Published var responseString = "Loading..."
    @Binding var medicine: Medicine

    private var imageCache: [String: Image] = [:]
    private let getMedicineAPIAction = GetMedicineAction()

    // 초기화
    init(medicine: Binding<Medicine>) { // non-optional로 변경
        _medicine = medicine
    }
    
    // Fetch
    func fetchDrugInfo(kdCode: String) {
        self.getMedicineAPIAction.fetchDrugInfo(kdCode: kdCode) { response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.responseString = "Error: \(error.localizedDescription)"
                    return
                }
                
                guard let response = response else {
                    self.responseString = "No data received"
                    return
                }
                
                self.medicine.drugInfo = response.DrugInfo

                let base64String = response.DrugInfo.IdentaImage
                if let imageData = Data(base64Encoded: base64String), let uiImage = UIImage(data: imageData) {
                    let image = Image(uiImage: uiImage)
                    self.identaImage = image
                    self.imageCache[kdCode] = image
                    self.responseString = "Data fetched successfully"
                } else {
                    self.responseString = "Image decoding failed"
                }
            }
        }
    }

}
