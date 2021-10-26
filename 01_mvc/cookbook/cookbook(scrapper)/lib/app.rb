require_relative "cookbook"
require_relative "controller"
require_relative "router"

CSV_FILE = File.join(File.dirname(__FILE__), "recipes.csv")
cookbook = Cookbook.new(CSV_FILE)
controller = Controller.new(cookbook)

router = Router.new(controller)

# Start the app
router.run
