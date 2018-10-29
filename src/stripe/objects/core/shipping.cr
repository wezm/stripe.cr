struct Stripe::Shipping
  include JSON::Serializable

  getter address : Address
  getter carrier : String?
  getter name : String
  getter phone : String?
  getter tracking_number : String?
end
