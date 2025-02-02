import SwiftUI

struct ContentView: View {
    
    @State private var data: String = "Yükleniyor..."
    let dataManager = DataManager()
    
    var body: some View {
        VStack {
            Text(data)
                .font(.title2)
                .fontWeight(.semibold)
            
            Button("Veriyi Yükle") {
                Task {
                    data = await dataManager.increment()
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
            .controlSize(.large)
            
        }
    }
}

//MARK: Actors - Veri Yarışını(data race) önleme
//MARK: Actors, Swift'te eş zamanlı (concurrent) çalışan iş parçacıklarının (threads) aynı anda bir veri üzerinde çakışmasını önlemek için kullanılır.
actor DataManager {
    
    private var data: String = "Başlangıç Verisi"
    
    func increment() async -> String {
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        return "Yeni Veri"
        
    }
}


#Preview {
    ContentView()
}
