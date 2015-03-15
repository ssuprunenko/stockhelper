# == Schema Information
#
# Table name: releases
#
#  id           :integer          not null, primary key
#  name         :string
#  release_type :string
#  title        :string
#  description  :text
#  shoot_date   :date
#  witness_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Release < ActiveRecord::Base
  extend Enumerize
  alias_attribute :type, :release_type

  enumerize :type,
            in: [:model, :property],
            default: :property,
            predicates: true,
            scope: true

  validates :title, :description, :shoot_date, :witness_date, presence: true

  before_save :set_name

  def to_s
    title
  end

  private

  def set_name
    self.name = "release_#{type}_#{title.parameterize('_')}" unless name.present?
  end
end
