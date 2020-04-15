//
//  NetworkAccessManager.swift
//  CRP
//
//  Created by Robert Mietelski on 15.01.2019.
//  Copyright © 2019 altconnect. All rights reserved.
//

import Alamofire

public class NetworkAccessManager {

    // MARK: - Public attributes
    
    public var baseURL: URL
    public var applicationContext: String?
    
    public lazy var serverAddress: URL = {
        guard self.applicationContext != nil else {
            return self.baseURL
        }
        return self.baseURL.appendingPathComponent(self.applicationContext!)
    }()
    
    // MARK: - Private attributes
    
    private let operationQueue = OperationQueue()
    private var session: SessionManager
    
    // MARK: - Initialization
    
    init(baseURL: URL,
         applicationContext: String?,
         sessionConfiguration:URLSessionConfiguration = URLSessionConfiguration.default,
         delegate: SessionDelegate = SessionDelegate(),
         adapter: RequestAdapter? = nil,
         retrier: RequestRetrier? = nil,
         serverTrustManager: ServerTrustPolicyManager? = nil) {
        
        sessionConfiguration.urlCredentialStorage = nil
        let session = SessionManager(configuration: sessionConfiguration,
                                     delegate: delegate,
                                     serverTrustPolicyManager: serverTrustManager)
        session.adapter = adapter
        session.retrier = retrier
        self.baseURL = baseURL
        self.applicationContext = applicationContext
        self.session = session
    }

    // MARK: - Access methods

    public func sessionOperation(URLString: String,
                                 method: HTTPMethod,
                                 parameters: Parameters?,
                                 queryParameters: Parameters? = nil,
                                 encoding: ParameterEncoding,
                                 headers: HTTPHeaders?,
                                 success: (([String: Any]) -> Void)?,
                                 failure: ((NetworkError) -> Void)?) {

        var url = self.serverAddress.appendingPathComponent(URLString)
        if let queryParameters = queryParameters {
            var urlComponents = URLComponents(string: url.absoluteString)
            urlComponents?.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
            url = urlComponents?.url ?? self.serverAddress.appendingPathComponent(URLString)
        }

        let components = URLSessionTaskComponents(url: url,
                                                  method: method,
                                                  parameters: parameters,
                                                  encoding: encoding,
                                                  headers: headers,
                                                  success: success,
                                                  failure: failure)
        Logger.debug("Request url: \(components.url)")
        self.session.request(components.url,
                             method: components.method,
                             parameters: components.parameters,
                             encoding: components.encoding,
                             headers: components.headers)
            .responseJSON(completionHandler: { response in
                let resolver = JSONResponseResolver(components: components)
                resolver.resolve(response: response)
            })
    }
}
