require_relative 'cookbook'    # You need to create this file!
require_relative 'cookbook_online'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'controller_online'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)
cookbook_online   = CookbookOnline.new(csv_file)
controller = Controller.new(cookbook)
controller_online = ControllerOnline.new(cookbook_online)

router = Router.new(controller, controller_online)

# Start the app
router.run
