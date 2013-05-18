require 'test/unit'
begin; require 'turn/autorun'; rescue LoadError; end
require 'act_as_enumerable'
require 'shoulda'

require 'coveralls'
Coveralls.wear!

class EnumPlusTest < Test::Unit::TestCase

  context 'when defining a new object' do
    setup do
      class EnumPlusTest
      end

      @enum_plus_test = EnumPlusTest.new
    end

    should 'define :enum' do
      assert EnumPlusTest.singleton_methods.include? :enum
    end
  end

  context 'with an object using :enum method (e.g. :gender)' do
    setup do
      class EnumPlusTest
        enum :gender, %w(male female)
      end

      @enum_plus_test = EnumPlusTest.new
    end

    should 'define `gender_values` method' do
      assert EnumPlusTest.singleton_methods.include? :gender_values
      assert_equal %w(male female), EnumPlusTest.gender_values
    end

    context 'without I18n' do
      should 'define `gender_caption` method' do
        assert EnumPlusTest.singleton_methods.include? :gender_captions
        assert_equal %w(male female), EnumPlusTest.gender_captions
      end

      should 'define `.humanize_gender` method' do
        assert @enum_plus_test.methods.include? :humanize_gender

        %w(male female).each do |value|
          assert_equal value, @enum_plus_test.humanize_gender(value.to_sym)
        end
      end

      context 'without setting :gender' do
        should 'define `.gender_caption` method' do
          assert @enum_plus_test.methods.include? :gender_caption
          assert_equal nil, @enum_plus_test.gender_caption
        end
        %w(male female).each do |value|
          should "define `.#{value}?` method" do
            assert @enum_plus_test.methods.include? "#{value}?".to_sym
            %w(male female).each do |value2|
              assert_equal false, @enum_plus_test.send("#{value}?".to_sym)
            end
          end
        end
      end

      context 'with setting :gender' do
        %w(male female).each do |value|
          setup { @enum_plus_test.gender = value }

          should "define `.#{value}?` method" do
            assert @enum_plus_test.methods.include? "#{value}?".to_sym
          end
        end
      end
    end
  end

end
