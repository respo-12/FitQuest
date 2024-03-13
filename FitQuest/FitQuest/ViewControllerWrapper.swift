//
//  ViewControllerWrapper.swift
//  FitQuest
//
//  Created by Conner Holbrook on 3/12/24.
//
import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = ViewController

    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
