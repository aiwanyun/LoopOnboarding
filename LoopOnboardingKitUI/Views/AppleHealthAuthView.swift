//
//  AppleHealthAuthView.swift
//  LoopOnboarding
//
//  Created by Pete Schwamb on 3/4/22.
//

import SwiftUI
import HealthKit
import LoopKitUI

struct AppleHealthAuthView: View {

    var authorizeHealthStore: ((@escaping () -> Void) -> Void)?

    @State private var processing = false

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text(LocalizedString("苹果健康", comment: "Title on AppleHealthAuthView"))
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Image(frameworkImage: "AppleHealthLogo", decorative: true)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                Text(LocalizedString("Apple Health 可用于存储 Loop 中的血糖、胰岛素和碳水化合物数据。\n\n如果您授予 Loop 权限，Loop 还可以从支持 Apple Health 的血糖仪和胰岛素笔读取血糖和胰岛素数据", comment: "Onboarding, Apple Health Permissions intro paragraph"))
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    processing = true
                    authorizeHealthStore?() {
                        processing = false
                    }
                }) {
                    Text(LocalizedString("与Apple Health共享", comment:"Button title for starting apple health permissions request"))
                        .actionButtonStyle(.primary)
                }.disabled(processing == true)
            }
        }
        .padding()
        .environment(\.horizontalSizeClass, .compact)
        .navigationBarTitle("")
        .navigationBarHidden(false)
    }
}
