//
//  database.swift
//  HAP
//
//  Created by Bouke Haarsma on 19-07-16.
//
//

import Foundation

class FileStorage {
    enum Error: Swift.Error {
        case couldNotCreateDirectory
    }

    let path: String

    init(path: String) throws {
        if !FileManager.default.directoryExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            } catch {
                throw Error.couldNotCreateDirectory
            }
        }
        self.path = path
    }

    subscript(key: String) -> Data? {
        get {
            let entityPath = URL(fileURLWithPath: path).appendingPathComponent(key)
            guard let data = try? Data(contentsOf: entityPath, options: []) else {
                return nil
            }
            return data
        }
        set {
            let entityPath = URL(fileURLWithPath: path).appendingPathComponent(key)
            if let newValue = newValue {
                try! newValue.write(to: entityPath)
            } else {
                try! FileManager.default.removeItem(at: entityPath)
            }
        }
    }
}