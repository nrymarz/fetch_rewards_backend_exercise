class PayerSerializer < ActiveModel::Serializer
  attributes :payer, :points

  def payer
    object.name
  end
end
