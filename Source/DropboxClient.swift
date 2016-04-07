
/* Autogenerated. Do not edit. */

import Foundation
import Alamofire
/// The client for the API. Call routes using the namespaces inside this object.
public class DropboxClient : BabelClient {
    let accessToken : DropboxAccessToken
    static var version = "3.0.0"
    
    /// Shared instance for convenience
    public static var sharedClient : DropboxClient!
    
    public override func additionalHeaders(noauth : Bool) -> [String: String] {
        var headers = ["User-Agent": "OfficialDropboxSwiftSDKv2/\(DropboxClient.version)"]
        if (!noauth) {
            headers["Authorization"] = "Bearer \(self.accessToken)"
        }
        return headers
    }
    
    public var backgroundCompletionHandler: (() -> Void)? {
        get {
            return manager.backgroundCompletionHandler
        }
        set {
            manager.backgroundCompletionHandler = newValue
        }
    }
    
    public convenience init(accessToken: DropboxAccessToken) {
        let configuration = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier("com.nitridium.studioMusicPlayerDL.backgroundTask")
        let manager = Manager(configuration: configuration, serverTrustPolicyManager: DropboxServerTrustPolicyManager())
        manager.startRequestsImmediately = false
        self.init(accessToken: accessToken,
                  manager: manager,
                  baseHosts: [
                    "meta"    : "https://api.dropbox.com/2",
                    "content" : "https://api-content.dropbox.com/2",
                    "notify"  : "https://notify.dropboxapi.com/2"
		          ])
    }
    /// Routes within the files namespace. See FilesRoutes for details.
    public var files : FilesRoutes!
    /// Routes within the sharing namespace. See SharingRoutes for details.
    public var sharing : SharingRoutes!
    /// Routes within the users namespace. See UsersRoutes for details.
    public var users : UsersRoutes!
    public init(accessToken: DropboxAccessToken, manager: Manager, baseHosts: [String : String]) {
        self.accessToken = accessToken
        super.init(manager: manager, baseHosts: baseHosts)
        self.files = FilesRoutes(client: self)
        self.sharing = SharingRoutes(client: self)
        self.users = UsersRoutes(client: self)
    }
}
