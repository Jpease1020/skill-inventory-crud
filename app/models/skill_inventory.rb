# require_relative 'skill'   why do we not need to require the skill rb file?
require 'sequel'

class SkillInventory

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory.sqlite3")
    end
  end

  def self.create_table
    database.create_table :skills do
      primary_key :id
      String :name
      String :status
    end
  end

  def self.create(skill)
    skills = dataset
    id = skills.insert({ :name => skill[:name], :status => skill[:status] })
    # so we are inserting a hash we are creating as an argument into the insert method which takes the
#     and the key :name points to the value skill[:name] which is the vlaue of the key :name in the skill hash?
    find(id)
  end

  def self.all
    raw_skills = dataset.all
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.find(id)
    raw_skill = dataset.where(id: id).first
    Skill.new(raw_skill)
  end

  def self.update(id, skill)
    dataset.where(id: id).update(name: skill.name, status: skill.status)
  end

  def self.delete(id)
    dataset.where(id: id).delete
  end

  def self.delete_all
    dataset.delete
  end

  def self.dataset
    database.from(:skills)
  end

  private_class_method :dataset

end
