require_relative 'cookbook'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')  # c'est quoi FILE ?
cookbook   = Cookbook.new(csv_file)             # instance DB ,csv file en initialize
controller = Controller.new(cookbook)           # instance contoller , instance de db en initialize

router = Router.new(controller)                 # on passe le controller a l instance du router

# Start the app
router.run
