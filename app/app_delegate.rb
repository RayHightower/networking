INSTAGRAM_CLIENT_ID = 'Your ID'

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
