//
//  DrawingView.swift
//  Drawing
//
//  Created by RLS77777777 on 2021/10/19.
//

import SwiftUI

struct DrawingView: View {
    @State private var selectedColor: DrawColor = .red
    @State private var canvasRect: CGRect = .zero
    @State private var endedDrawPoints: [DrawPoints] = []
    var body: some View {
        VStack {
            Canvas(
                endedDrawPoints: $endedDrawPoints,
                selectedColor: $selectedColor,
                canvasRect: $canvasRect
            )
            HStack {
                Spacer()
                Button(action: {
                    selectedColor = .red
                }) {
                    Text("赤")
                        .frame(width: 80, height: 100, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                }
                Button(action: {
                    selectedColor = .clear
                }) {
                    Text("消しゴム")
                        .frame(width: 80, height: 100, alignment: .center)
                        .background(Color.white)
                        .cornerRadius(20)
                        .foregroundColor(.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.black, lineWidth: 4)
                        )
                }
                Button(action: {}) {}
                Spacer()
            }
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}
