require 'yaml'
require 'json'
require "awesome_print"

# Should read through actions.yml and be ready to hand off cards to players
class ActionHelper
  def initialize(game=nil)
    @game = game
    @actions = YAML.load_file('resources/actions.yml')
    ap @actions
    @actions_array = []
    @actions.each do |type, info| 
      info.each do |public_type, info2|
        info2.each do |action_name, action_info|
          @actions_array << {
            :type => type,
            :public => public_type,
            :name => action_name,
            :desc => action_info
          }
        end
      end
    end
  end

  def draw_three
    draws = @actions_array.sample(3)
    draws.each { |a| @actions_array.delete a }
    ap draws
    draws
  end
end

a = ActionHelper.new
a.draw_three