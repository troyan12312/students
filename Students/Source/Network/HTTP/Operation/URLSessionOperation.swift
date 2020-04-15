//
//  URLSessionOperation.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 13.07.2018.
//

// import Alamofire
//
// open class URLSessionOperation: Operation {
//
//     // MARK: - Public properties
//
//     public let session: Session
//     public let components: URLSessionTaskComponents
//
//     public private(set) var request: DataRequest?
//
//     public var statusCode: Int? {
//         if let response = self.request?.task?.response as? HTTPURLResponse {
//             return response.statusCode
//         }
//         return nil
//     }
//
//     // MARK: - Public properties
//
//     private var finishedOperation: Bool = false
//     private var executingOperation: Bool = false
//
//     // MARK: - Initialization
//
//     public init(session: Session, components: URLSessionTaskComponents) {
//         self.session = session
//         self.components = components
//         super.init()
//     }
// }
//
// extension URLSessionOperation {
//
//     // MARK: - Metody klasy bazowej
//     open override var isFinished: Bool {
//         set {
//             if self.finishedOperation != newValue {
//
//                 self.willChangeValue(forKey: "isExecuting")
//                 self.finishedOperation = newValue
//                 self.didChangeValue(forKey: "isExecuting")
//             }
//         }
//         get {
//             return self.finishedOperation
//         }
//     }
//
//     open override var isExecuting: Bool {
//         set {
//             if self.executingOperation != newValue {
//
//                 self.willChangeValue(forKey: "isFinished")
//                 self.executingOperation = newValue
//                 self.didChangeValue(forKey: "isFinished")
//             }
//         }
//         get {
//             return self.executingOperation
//         }
//     }
//
//     open override func start() {
//         if self.isCancelled {
//             self.finishedOperation = true
//         }
//         else {
//             self.executingOperation = true
//             self.main()
//         }
//     }
//
//     open override func main() {
//
//         Logger.debug("URL: \(self.components.url)")
//         Logger.debug("Parameters: \(self.components.parameters ?? [:])")
//
//         let methodStart = Date()
//         self.request = self.session.request(self.components.url,
//                                             method: self.components.method,
//                                             parameters: self.components.parameters,
//                                             encoding: self.components.encoding,
//                                             headers: self.components.headers)
//                                    .validate()
//             .responseJSON(completionHandler: { [weak self] response in
//                 guard let components = self?.components else { return }
//
//                 let resolver = JSONResponseResolver(components: components)
//                 resolver.resolve(response: response, requestStartDate: methodStart)
//             })
//         self.request?.resume()
//     }
//
//     open override func cancel() {
//         self.request?.cancel()
//         super.cancel()
//     }
// }
//
// extension URLSessionOperation {
//     private func completeOperation() {
//
//         self.finishedOperation = true
//         self.executingOperation = false
//     }
// }
