//
//  HTTPServerConfiguration.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 13.07.2018.
//

import Foundation

public struct HTTPServerConfiguration {
    
    public var host: String?
    public var port: String?
    public var serverProtocol: String?
    public var applicationContext: String?
    
    public var serverAddress: URL? {
        guard self.serverProtocol != nil, self.host != nil else {
            return nil
        }
        if self.port != nil {
            return URL(string: "\(self.serverProtocol!)://\(self.host!):\(self.port!)")
        }
        return URL(string: "\(self.serverProtocol!)://\(self.host!)")
    }
    
    // MARK: - Domyślna konfiguracja wczytywana z pliku Config.plist
    public static var `default`: HTTPServerConfiguration = {
        
        var serverConfiguration = HTTPServerConfiguration()
        
        serverConfiguration.host = ConfigurationManager.serverHost
        serverConfiguration.port = ConfigurationManager.serverPort
        serverConfiguration.serverProtocol = ConfigurationManager.serverProtocol
        serverConfiguration.applicationContext = ConfigurationManager.applicationContext
        
        return serverConfiguration;
    }()
    
    // MARK: - Konstruktory
    public init() {}
    public init(host: String?, port: String?, serverProtocol: String?, applicationContext: String?) {
        
        self.host = host
        self.port = port
        self.serverProtocol = serverProtocol
        self.applicationContext = applicationContext
    }
}
