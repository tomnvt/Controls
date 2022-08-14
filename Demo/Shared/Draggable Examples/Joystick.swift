import DraggableControl
import SwiftUI

struct Joystick: View {

    @State var radius = 0.0
    @State var angle = 0.0

    func ended() { radius = 0 }

    var body: some View {
        Draggable(geometry: .polar(), value: $radius, value2: $angle, onEnded: ended) { geo in
            ZStack(alignment: .center) {
                Circle().foregroundColor(.gray)
                Circle().foregroundColor(.red)
                    .frame(width: geo.size.width / 10, height: geo.size.height / 10)
                    .offset(x: -radius * sin(angle * 2.0 * .pi) * geo.size.width / 2.0,
                            y: radius * cos(angle * 2.0 * .pi) * geo.size.height / 2.0)
                    .animation(.spring(response: 0.1), value: radius)
            }
        }
    }
}

struct Joystick_Previews: PreviewProvider {
    static var previews: some View {
        Joystick()
    }
}
