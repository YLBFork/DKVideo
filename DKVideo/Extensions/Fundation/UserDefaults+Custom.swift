//
//  UserDefaults+Custom.swift
//  DKVideo
//
//  Created by 朱德坤 on 2019/3/7.
//  Copyright © 2019 DKJone. All rights reserved.
//

import Foundation

// MARK: - 自定义缓存

extension UserDefaults {
    /// 是否开启黑色模式
    var isDark: Bool {
        get { return bool(forKey: #function) }
        set { setValue(newValue, forKey: #function) }
    }

    var themeColor: Int {
        get { return integer(forKey: #function) }
        set { setValue(newValue, forKey: #function) }
    }

    /// 只检查一次黑暗模式
    static var hasCheckedDarkModel: Bool {
        get { standard.bool(forKey: #function) }
        set { standard.setValue(newValue, forKey: #function) }
    }

    /// 上一次打开的应用版本
    static var lastVersion: String {
        get { standard.string(forKey: #function) ?? "" }
        set { standard.setValue(newValue, forKey: #function) }
    }

    static var currentVip: VipAnalysis {
        get {
            return .from(json: JSON(standard.string(forKey: #function) ?? ""))
        }
        set {
            standard.setValue(newValue.toJSONString() ?? "", forKey: #function)
        }
    }

    /// 模仿电脑版请求
    static var isPCAgent: Bool {
        get { return standard.bool(forKey: #function) }
        set { standard.setValue(newValue, forKey: #function) }
    }

    /// 打开APP自动开始下载
    static var autoStartDownload: Bool {
        get { return standard.bool(forKey: #function) }
        set { standard.setValue(newValue, forKey: #function) }
    }
}