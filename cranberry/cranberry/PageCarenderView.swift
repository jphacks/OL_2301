//
//  PageCarenderView.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

import SwiftUI

struct PageCarenderView: View {
    var body: some View {

        ZStack {
            Color.yellow    // 背景色
            Text("Carender")
        } // ZStack

    } // body
} // View

struct PageCarenderView_Previews: PreviewProvider {
    static var previews: some View {
        PageCarenderView()
    }
}
//import SwiftUI
//
//struct PageCarenderView: UIViewRepresentable {
//    let didSelectDate: (_ dateComponents: DateComponents) -> Void
//
//    final public class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
//        let didSelectDate: (_ dateComponents: DateComponents) -> Void
//
//        init(
//            didSelectDate: @escaping (_ dateComponents: DateComponents) -> Void
//        ) {
//            self.didSelectDate = didSelectDate
//        }
//
//        public func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
//            guard let dateComponents = dateComponents else {
//                return
//            }
//            didSelectDate(dateComponents)
//        }
//    }
//
//
//    public func makeCoordinator() -> Coordinator {
//        Coordinator(didSelectDate: didSelectDate)
//    }
//
//
//    func makeUIView(context: Context) -> some UIView {
//        let selection = UICalendarSelectionSingleDate(delegate: context.coordinator)
//
//        let calendarView = UICalendarView()
//        calendarView.selectionBehavior = selection
//        return calendarView
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {}
//}
//
//struct PageCalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageCarenderView { dateComponents in
//
//        }
//    }
//}
