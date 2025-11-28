import Foundation
import SwiftUI

#if canImport(AppKit)
import AppKit

public protocol XViewRepresentable: NSViewRepresentable where NSViewType == ViewType {
    associatedtype ViewType: XView
    
    func makeView(context: Context) -> ViewType
    func updateView(_ view: ViewType, context: Context)
    func sizeThatFits(_ proposal: ProposedViewSize, view: ViewType, context: Context) -> CGSize?
}

extension XViewRepresentable {
    public func makeNSView(context: Context) -> NSViewType {
        self.makeView(context: context)
    }

    public func updateNSView(_ nsView: NSViewType, context: Context) {
        self.updateView(nsView, context: context)
    }

    public func sizeThatFits(_ proposal: ProposedViewSize, nsView: NSViewType, context: Context) -> CGSize? {
        self.sizeThatFits(proposal, view: nsView, context: context)
    }
}
#endif

#if canImport(UIKit)
import UIKit

public protocol XViewRepresentable: UIViewRepresentable where UIViewType == ViewType {
    associatedtype ViewType: XView
    
    func makeView(context: Context) -> ViewType
    func updateView(_ view: ViewType, context: Context)
    func sizeThatFits(_ proposal: ProposedViewSize, view: ViewType, context: Context) -> CGSize?
}

extension XViewRepresentable {
    public func makeUIView(context: Context) -> UIViewType {
        self.makeView(context: context)
    }

    public func updateUIView(_ nsView: UIViewType, context: Context) {
        self.updateView(nsView, context: context)
    }

    public func sizeThatFits(_ proposal: ProposedViewSize, nsView: UIViewType, context: Context) -> CGSize? {
        self.sizeThatFits(proposal, view: nsView, context: context)
    }
}

#endif


