import SwiftUI

struct ContentView: View {
    let redViewController = UIViewController()
    let greenViewController = UIViewController()
    let blueViewController = UIViewController()
    
    var body: some View {
        TabView {
            WrappedView(viewController: redViewController)
            WrappedView(viewController: greenViewController)
            WrappedView(viewController: blueViewController)
        }
        .tabViewStyle(.page)
        .onAppear {
            redViewController.view.backgroundColor = .red
            greenViewController.view.backgroundColor = .green
            blueViewController.view.backgroundColor = .blue
        }
        .ignoresSafeArea()
    }
}

struct WrappedView: View {
    let viewController: UIViewController
    
    var body: some View {
        // UIViewControllerRepresentableに準拠するパターン
        UIViewControllerWrapper(viewController: viewController)
            .background(.gray)
            .ignoresSafeArea()
        
        // UIViewRepresentableに準拠するパターン
//        UIViewWrapper(viewController: viewController)
//            .background(.gray)
//            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UIViewWrapper: UIViewRepresentable {
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func makeUIView(context: Context) -> some UIView {
        return viewController.view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct UIViewControllerWrapper: UIViewControllerRepresentable {
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
