require_relative '../spec_helper'

class GenderTestModel
  include ActAsEnumerable

  attr_accessor :gender

  enum :gender, %w(male female)
end

describe GenderTestModel do
  it 'defines gender_values class method' do
    GenderTestModel.singleton_methods.should include(:gender_values)
    GenderTestModel.gender_values.should == %w(male female)
  end

  describe 'without I18n' do
    subject { GenderTestModel.new }

    it 'defines gender_caption class method' do
      GenderTestModel.singleton_methods.should include(:gender_captions)
      GenderTestModel.gender_captions.should == %w(Male Female)
    end

    it 'defines humanize_gender instance method' do
      subject.methods.should include(:humanize_gender)
      %w(Male Female).each do |value|
        subject.humanize_gender(value.to_sym).should == value
      end
    end

    # describe 'without setting :gender' do
    #   it 'defines gender_caption instance method' do
    #     subject.methods.should include(:gender_caption)
    #     subject.gender_caption.should be_nil
    #   end

    #   %w(male female).each do |value|
    #     it "defines #{value}? instance method" do
    #       subject.methods.should include("#{value}?".to_sym)
    #     end
    #   end

    #   %w(male female).each do |value|
    #     describe "#{value}?" do
    #       it 'returns false' do
    #         subject.send("#{value}?".to_sym).should be_false
    #       end
    #     end
    #   end
    # end

    # describe 'with setting :gender' do
    #   before do
    #     @gender_value = 'male'
    #     subject.gender = @gender_value
    #   end

    #   it 'defines gender_caption instance method' do
    #     subject.methods.should include(:gender_caption)
    #     subject.gender_caption.should == 'male'
    #   end

    #   %w(male female).each do |value|
    #     it "defines #{value}? instance method" do
    #       subject.methods.should include("#{value}?".to_sym)
    #     end
    #   end

    #   describe 'male?' do
    #     it 'returns true' do
    #       subject.male?.should be_true
    #     end
    #   end

    #   describe 'female?' do
    #     it 'returns false' do
    #       subject.female?.should be_false
    #     end
    #   end
    # end
  end
end
