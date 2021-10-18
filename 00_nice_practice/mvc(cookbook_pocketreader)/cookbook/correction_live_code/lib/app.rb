require_relative 'repository'    # You need to create this file!
require_relative 'controller'  # You need to create this file!
require_relative 'router'

csv_file   = File.join(__dir__, 'recipes.csv')
repo   = Repository.new(csv_file)
controller = Controller.new(repo)

router = Router.new(controller)

# Start the app
router.run
