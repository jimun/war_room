require 'yaml'
require 'json'
require "awesome_print"

# Should read through actions.yml and be ready to hand off cards to players
class ActionHelper
  def initialize(game=nil)
    @game = game
    @actions = YAML.load_file('resources/actions.yml')

    @actions_array = []
    @actions.each do |type, info| 
      ap info
      info.each do |public_type, info2|
        info2.each do |action_name, action_info|
          o = {
            :type => type,
            :public => public_type,
            :name => action_name,
            :desc => action_info,
            :id => action_info["id"]
          }
          ap o
          @actions_array << o
        end
      end
    end
  end

  def draw_three
    draws = @actions_array.sample(3)
    draws.each { |a| @actions_array.delete a }
    draws.map {|action| action[:id]}
  end
end

a = ActionHelper.new
ap a.draw_three