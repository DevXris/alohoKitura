import PackageDescription

let package = Package(
    name: "alohaKitura",
    dependencies: [
    	.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 6),
    	.Package(url: "https://github.com/IBM-Swift/HeliumLogger.git", majorVersion: 1, minor: 6),
    	.Package(url: "https://github.com/IBM-Swift/Swift-cfenv.git", majorVersion: 3, minor: 0),
    ]
)
