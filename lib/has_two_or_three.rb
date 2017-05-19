require 'has_two_or_three/version'
require 'active_support/concern'
require 'active_support/inflector'

module HasTwoOrThree
  extend ActiveSupport::Concern

  def self.list
    @list ||= []
  end

  class_methods do

    private

    def has_two_or_three(association_name, *options)
      HasTwoOrThree.list << [self, association_name]

      has_many association_name, *options

      validate :"validate_#{association_name}_actually_has_two_or_three_members"

      define_method :"validate_#{association_name}_actually_has_two_or_three_members" do
        errors.add(:"#{association_name}", 'can only have two or three members.') unless [2,3].include?(send(association_name).length)
      end

      private :"validate_#{association_name}_actually_has_two_or_three_members"
    end
  end

  included do
    validate :verify_record_is_one_of_two_or_three_on_listed_associations
  end

  private

  def verify_record_is_one_of_two_or_three_on_listed_associations
    HasTwoOrThree.list.each do |klass, inverse_association_name|
      self.class.reflect_on_all_associations.each do |association|
        target_inverse_association_name = association.inverse_of || association.automatic_inverse_of

        if association.klass == klass && target_inverse_association_name == inverse_association_name

          parent = send(association.name)
          siblings = parent.send(inverse_association_name)

          errors.add(:"#{association.name}", "can only have two or three #{inverse_association_name}.") unless [2,3].include?(siblings.length)
        end

      end
    end
  end
end

ActiveRecord::Base.include HasTwoOrThree if defined?(ActiveRecord::Base)