import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth


// 로그인 상태 관리 
class UserManager: ObservableObject {
    @Published var isLogged: Bool = false
}


@main
struct yakalApp: App {

    init() {
        // 메인번들에 있는 카카오 앱키 불러오기
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""

        // kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
     }
    @StateObject private var userManager = UserManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userManager)
        }
    }
}
