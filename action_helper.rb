require 'yaml'

# Should read through actions.yml and be ready to hand off cards to players
class ActionHelper
  def initialize(game)
    @game = game
    @actions = JSON.parse YAML.load_file('resources/actions.yml')
    # TODO: shuffle the cards
  end

  def draw_three
  end
end