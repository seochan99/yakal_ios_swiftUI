//
//import SwiftUI
//
//struct LoginView: View {
//    var body: some View {
//        Button {
//            if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                    print(oauthToken)
//                    print(error)
//                }
//            } else {
//                UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                    print(oauthToken)
//                print(error)
//                }
//            }
//        } label : {
//            Image("kakao_login_large_wide")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width : UIScreen.main.bounds.width * 0.9)
//        }
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
