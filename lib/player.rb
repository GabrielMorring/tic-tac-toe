class Player
  attr_accessor :name, :plays

  def initialize(name)
    self.name = name
    self.plays = []
  end
end
