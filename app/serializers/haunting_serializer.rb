class HauntingSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :ghost, serializer: HauntingsGhostSerializer
  belongs_to :haunted_house, serializer: HauntingsHouseSerializer
end
