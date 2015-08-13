class Genre < ActiveRecord::Base
  has_many :artists

  validates :name, presence: true, length: {minimum: 3}, uniqueness: true

  #acceptance... validates : terms_of_service, acceptance: true
  #if/unless...
    # valides :card_number, presence: true, if: :paid_with_card?

    # def paid_with_card?
    #   payment_type == "card"
    # end



end

# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
