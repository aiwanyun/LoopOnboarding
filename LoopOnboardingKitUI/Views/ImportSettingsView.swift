//
//  ImportSettingsView.swift
//  LoopOnboardingKitUI
//
//  Created by Pete Schwamb on 2/21/22.
//

import SwiftUI
import LoopKitUI

struct ImportSettingsView: View {

    private var didFinish: ((Bool) -> Void)?
    private var settingsDate: Date

    private var settingsAgeFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        return formatter
    }()

    init(settingsDate: Date, didFinish: ((Bool) -> Void)?) {
        self.settingsDate = settingsDate
        self.didFinish = didFinish
    }

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(LocalizedString("找到设置", comment: "Title on ImportSettingsView"))
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(String(format: LocalizedString("我们检测到您的 Nightscout 中存储了循环设置！ 它们的最后更新时间是%1$@。 您想导入它们吗？\n\n导入后，您仍需要在以下屏幕中检查导入的设置并验证它们是否正确。", comment: "Format string for main guidance text on ImportSettingsView (1: age of settings)"), settingsAgeFormatter.localizedString(fromTimeInterval: settingsDate.timeIntervalSinceNow)))
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(.secondary)
            Spacer()
            Button(action: {
                self.didFinish?(true)
            }) {
                Text(LocalizedString("导入保存的设置", comment:"Button title for choosing to import settings from nightscout"))
                    .actionButtonStyle(.primary)
            }
            Button(action: {
                self.didFinish?(false)
            }) {
                Text(LocalizedString("不要导入设置", comment:"Button title for skipping setting import from nightscout"))
                    .actionButtonStyle(.secondary)
            }
        }
        .padding()
        .environment(\.horizontalSizeClass, .compact)
        .navigationBarTitle("")
    }
}

struct ImportSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImportSettingsView(settingsDate: Date().addingTimeInterval(-24 * 60 * 60)) { (shouldImport) in
                print("Should import: \(shouldImport)")
            }
        }
        .previewDevice("iPod touch (7th generation)")
    }
}
