require 'has_two_or_three/version'
require 'active_support/concern'
require 'active_support/inflector'

module HasTwoOrThree
  extend ActiveSupport::Concern

  class_methods do

    private

    def has_two_or_three(association_name, *options)
      has_many association_name, *options

      define_method :"validate_#{association_name}_actually_has_two_or_three_members" do
        [2,3].include?(send(association_name).length)
      end

      validates :"validate_#{association_name}_actually_has_two_or_three_members"
    end

    def belongs_to_set_of_two_or_three association_name, *options
      belongs_to association_name, *options

      define_private_method :"validate_#{association_name}_is_actually_two_or_three_of_set" do
        association = self.class.reflect_on_association(association_name)
        inverse_association_name = association.inverse_of || association.automatic_inverse_of

        parent = send(association_name)
        siblings = parent.send(inverse_association_name)

        [2,3].include?(siblings.length)
      end

      validates :"validate_#{association_name}_is_actually_two_or_three_of_set"
    end
  end

end

ActiveRecord::Base.include HasTwoOrThree if defined?(ActiveRecord::Base)