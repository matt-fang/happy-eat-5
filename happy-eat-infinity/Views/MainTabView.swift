import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var discoveryPath: [NavScreen] = []
    @State private var galleryPath: [NavScreen] = []
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DiscoverView(path: $discoveryPath)
                .tabItem {
                    Label("Discover", systemImage: "sparkles")
                }
                .tag(0)
            
            GalleryView(path: $galleryPath)
                .tabItem {
                    Label("Gallery", systemImage: "square.grid.3x3")
                }
                .tag(1)
        }
    }
}
//
//
//#Preview {
//    MainTabView()
//}
