import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                 .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Home")
                }
            PopularView()
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("Popular")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
