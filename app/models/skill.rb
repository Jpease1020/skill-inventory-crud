class Skill
  attr_accessor :id,
                :name,
                :status

  def initialize(data)
    @id          = data[:id]
    @name        = data[:name]
    @status      = data[:status]
  end
end
