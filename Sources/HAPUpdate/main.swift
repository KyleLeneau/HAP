import Foundation

let path = "/System/Library/PrivateFrameworks/HomeKitDaemon.framework"
guard let framework = Bundle(path: path) else {
    print("No HomeKitDaemon private framework found")
    exit(1)
}
guard let plistUrl = framework.url(forResource: "plain-metadata-full", withExtension: "config") else {
    print("Resource plain-metadata-full.config not found in HomeKitDaemon.framework")
    exit(1)
}
do {
    try Inspector.inspect(source: plistUrl, target: "Sources/HAP/Base/Generated.swift")
} catch {
    print("Couldn't update: \(error)")
}
