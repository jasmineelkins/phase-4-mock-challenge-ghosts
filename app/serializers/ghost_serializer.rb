class GhostSerializer < ActiveModel::Serializer
  attributes :id, :name, :age_at_death, :haunted_houses

  has_many :haunted_houses, serializer: GhostHauntedHouseSerializer
end
