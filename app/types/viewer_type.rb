ViewerType = GraphQL::ObjectType.define do
  name 'Viewer'
  description 'Currently authenticated user.'
  interfaces [GraphQL::Relay::Node.interface]
  global_id_field :id

  field :email, !types.String, "The email address of the currently logged in User"
  field :is_anonymous,   types.Boolean, "Flag to represent an anonymous user."
end
