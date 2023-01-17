import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeVCView().ignoresSafeArea(.all, edges: .bottom)
    }
}

//Bridge SwiftUI and UIKit
struct HomeVCView: UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: HomeView())
    }
}
