//
//  Buttons.swift
//  swiftElements
//
//  Created by Nitesh Poudel on 3/6/25.
//

import SwiftUI

// MARK: - Buttons

public enum Buttons {
    public struct BasicButton: View {
        public var title: String
        public var action: () -> Void

        public init(title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

        public var body: some View {
            Button(action: action) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }

    public struct FullWidthButton: View {
        public var title: String
        public var action: () -> Void

        public init(title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

        public var body: some View {
            Button(action: action) {
                HStack {
                    Spacer()
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()

                    Spacer()
                }
            }
            .background(Color.blue)
            .cornerRadius(8)
        }
    }

    public struct StatefulButton: View {
        public var title: String
        public var state: ButtonState
        public var action: () -> Void

        public init(
            title: String,
            state: ButtonState,
            action: @escaping () -> Void
        ) {
            self.title = title
            self.state = state
            self.action = action
        }

        public var body: some View {
            Button(action: action) {
                HStack {
                    Spacer()
                    switch state {
                        case .idle:
                            Text(title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()

                        case .loading:
                            ProgressView()
                                .padding()
                                .tint(.white)

                        case .success:
                            Text(title)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()

                        case .error:
                            Text("Something went wrong")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                    }

                    Spacer()
                }
            }
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}

// MARK: - ButtonState

public enum ButtonState {
    case idle
    case loading
    case success
    case error
}

#Preview {
    ScrollView {
        VStack {
            HStack {
                Text("Basic Button")
                Spacer()
            }
            Buttons.BasicButton(
                title: "Click",
                action: {}
            )
        }
        .padding()

        VStack {
            HStack {
                Text("Full Width Button")
                Spacer()
            }
            Buttons.FullWidthButton(
                title: "Click",
                action: {}
            )
        }
        .padding()

        VStack {
            HStack {
                Text("Stateful Button (enum:ButtonState)")
                Spacer()
            }
            Buttons.StatefulButton(
                title: "Click",
                state: .idle,
                action: {}
            )
            Buttons.StatefulButton(
                title: "Click",
                state: .loading,
                action: {}
            )
            Buttons.StatefulButton(
                title: "Click",
                state: .error,
                action: {}
            )
        }
        .padding()
    }
}
