
import SwiftUI
import MapKit

struct SwiftUIView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region).edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SwiftUIView()
}
