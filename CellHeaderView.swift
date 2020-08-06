import SwiftUI


struct CellHeaderView: View {
    @ObservedObject var viewModel: CellHeaderViewModel
    @State var headerCounter = Counter()

    init(viewModel: CellHeaderViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("CellHeaderView: \(headerCounter.getCounter())")
            .onTapGesture(count: 1, perform: {
            viewModel.tap()
        })
    }

}


class CellHeaderViewModel: ObservableObject {
    var id: UUID!
    private var store: CarStore?
    
    deinit {
        print("CellHeaderViewViewModel deinit")
    }
    init(id: UUID, store: CarStore) {
        print("CellHeaderViewViewModel init")
         self.id = id
        self.store = store
    }
    
    func tap() {
//        objectWillChange.send()
        store?.objectWillChange.send()
    }
    
}
