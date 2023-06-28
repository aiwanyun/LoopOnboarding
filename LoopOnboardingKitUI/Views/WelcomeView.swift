//
//  WelcomeView.swift
//  LoopOnboardingKitUI
//
//  Created by Pete Schwamb on 9/11/20.
//  Copyright © 2020 LoopKit Authors. All rights reserved.
//

import SwiftUI
import LoopKitUI

struct WelcomeView: View {
    var didContinue: (() -> Void)?
    var didLongPressOnLogo: (() -> Void)?

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Text(LocalizedString("欢迎来到循环", comment: "Title on WelcomeView"))
                .font(.largeTitle)
                .fontWeight(.semibold)
            Image(frameworkImage: "Loop", decorative: true)
                .onLongPressGesture(minimumDuration: 2) {
                    didLongPressOnLogo?()
                }

            Text(LocalizedString("在使用 Loop 之前，您需要配置一些设置。 这些设置的输入应精确且小心； 它们是 Loop 如何确定要输送的正确胰岛素量的关键部分。\n\n如果您是 Loop 的新手，请与您的糖尿病支持团队合作以确定最适合您的设置。", comment: "Descriptive text on WelcomeView"))
                .foregroundColor(.secondary)
            Spacer()
            Button(action: {
                self.didContinue?()
            }) {
                Text(LocalizedString("我们走吧！", comment:"Button title for starting setup"))
                    .actionButtonStyle(.primary)
            }
        }
        .padding()
        .environment(\.horizontalSizeClass, .compact)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
        .previewDevice("iPod touch (7th generation)")
    }
}
