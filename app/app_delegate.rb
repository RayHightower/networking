INSTAGRAM_CLIENT_ID = 'ae0854b622d84e1a93032ae40fda1c0a'

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    AFMotion::Client.build_shared("https://api.instagram.com/v1/") do
      operation :json

      header "Accept", "application/json"
    end

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = MainController.alloc.init
    @window.makeKeyAndVisible

    true
  end
end
