class TransactionSerializer < ActiveModel::Serializer
  attributes :payer, :points, :time

  def payer
    object.payer.try(:name)
  end
end
