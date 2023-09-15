import SwiftUI


struct ContentView: View {
    @EnvironmentObject var userManager: UserManager
    @State private var selectedTab = 0

    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(selectedTab == 0 ? "icon_home_fill" : "icon_home")
                        Text("홈")
                    }.tag(0)

                MypageView()
                    .tabItem {
                        Image(selectedTab == 1 ? "icon_mypage_fill" : "icon_mypage")
                            
                        Text("마이 페이지")
                    }.tag(1)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
