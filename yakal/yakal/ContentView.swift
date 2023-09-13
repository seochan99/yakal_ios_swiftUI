import SwiftUI


struct ContentView: View {
    @EnvironmentObject var userManager: UserManager

    var body: some View {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }

                MyPageView()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("MyPage")
                    }
            }
    }
}


struct MyPageView: View {
    var body: some View {
        Text("MyPage Screen")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
