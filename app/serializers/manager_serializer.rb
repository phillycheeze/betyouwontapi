class ManagerSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :auth_token
end
