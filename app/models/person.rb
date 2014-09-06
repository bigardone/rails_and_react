# == Schema Information
#
# Table name: people
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string
#  gender       :integer          default("0")
#  birth_date   :date
#  location     :string
#  phone_number :string
#  email        :string
#  headline     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  picture      :string
#

class Person < ActiveRecord::Base
  include PgSearch

  enum gender: [:male, :female]

  scope :sorted, ->{ order(first_name: :asc) }
  pg_search_scope :search,
                  against: [
                    :first_name,
                    :last_name,
                    :location,
                    :headline
                  ],
                  using: {
                    tsearch: {
                      prefix: true,
                      normalization: 2
                    }
                  }
end
