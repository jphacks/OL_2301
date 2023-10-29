//
//  PageCarenderView.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

//import SwiftUI
//
//struct PageCarenderView: View {
//
//    // ユーザーの気持ちを保存する変数
//    @Binding var feel: String
//    // ユーザーの出来事を保存する変数
//    @Binding var incident: String
//    // 日時保存する変数
//    @Binding var datetext: String
//    //まとめを押したかどうか
//    @Binding var isPress: Bool
//
//    var body: some View {
//
//        ZStack {
//            Color.yellow    // 背景色
//            Text("Carender")
//        } // ZStack
//
//    } // body
//} // View

//struct PageCarenderView_Previews: PreviewProvider {
//    static var previews: some View {
//        PageCarenderView()
//    }
//}
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


import SwiftUI

/// 指定日付より"後"の日付のみ選択可能にする
struct PageCarenderView: View {

    // 環境変数「calendar」「timeZone」を用意
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone

    // 選択可能な日付の範囲を作成
    var bounds: PartialRangeFrom<Date> {
        let start = calendar.date(from: DateComponents(
            timeZone: timeZone,
            year    : 2023,
            month   : 10,
            day     : 20))!

        return start...
    }

    @State private var dates: Set<DateComponents> = []

    var body: some View {

        // 引数「in:」に日付の範囲を指定する
        MultiDatePicker("複数の日付選択", selection: $dates, in: bounds)
    }
}
