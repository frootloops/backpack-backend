class Api::V1::TravelerSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email
end
