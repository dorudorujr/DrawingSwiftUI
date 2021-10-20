//
//  Canvas.swift
//  Drawing
//
//  Created by RLS77777777 on 2021/10/19.
//

import SwiftUI

struct Canvas: View {
    @Binding var endedDrawPoints: [DrawPoints]
    @Binding var selectedColor: DrawColor
    @Binding var canvasRect: CGRect
    @State private var tmpDrawPoints: DrawPoints = DrawPoints(points: [], color: .red)
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .border(.black, width: 2)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ (value) in
                            tmpDrawPoints.points.append(value.location)
                            tmpDrawPoints.color = selectedColor.color
                        })
                        .onEnded({ (value) in
                            endedDrawPoints.append(tmpDrawPoints)
                            tmpDrawPoints = DrawPoints(points: [], color: selectedColor.color)
                        })
                )
            
            ForEach(endedDrawPoints) { data in
                Path { path in
                    path.addLines(data.points)
                }
                .stroke(data.color, lineWidth: 10)
            }
            
            Path { path in
                path.addLines(tmpDrawPoints.points)
            }
            .stroke(selectedColor.color, lineWidth: 10)
        }
    }
}

//struct Canvas_Previews: PreviewProvider {
//    static var previews: some View {
//        Canvas()
//    }
//}
