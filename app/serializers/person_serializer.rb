class PersonSerializer < ActiveModel::Serializer
  attributes  :id,
              :first_name,
              :last_name,
              :full_name,
              :gender,
              :birth_date,
              :location,
              :phone_number,
              :email,
              :headline,
              :picture

  def full_name
    object.full_name
  end
end
