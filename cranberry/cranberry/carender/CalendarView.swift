//
//  CalendarView.swift
//  cranberry
//
//  Created by 金津愛澄 on 2023/10/28.
//
import SwiftUI
//import PlaygroundSupport
import Combine

class ContentViewModel: ObservableObject {
    private(set) var didSelectDateSubject: PassthroughSubject<Void, Never> = .init()
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        subscribeDidSelectDate()
    }
    
    private func subscribeDidSelectDate() {
        didSelectDateSubject
            .receive(on: DispatchQueue.main)
            .sink {
                print("did select")
            }
            .store(in: &cancellables)
    }
}

struct UICalendarViewRepresentable: UIViewRepresentable {
    private let didSelectDateSubject: PassthroughSubject<Void, Never>
    
    init(didSelectDateSubject: PassthroughSubject<Void, Never>) {
        self.didSelectDateSubject = didSelectDateSubject
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UICalendarView {
        let view = UICalendarView()
        let selection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = selection
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
    }
    
    class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        private let parent: UICalendarViewRepresentable
        
        init(_ parent: UICalendarViewRepresentable) {
            self.parent = parent
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
            parent.didSelectDateSubject.send()
        }
    }
}

//PlaygroundPage.current.liveView =UIHostingController(rootView: ContentView())
struct CalenderView: View {
    @StateObject private var viewModel: ContentViewModel = .init()

    var body: some View {
        UICalendarViewRepresentable(didSelectDateSubject: viewModel.didSelectDateSubject)
    }
}
