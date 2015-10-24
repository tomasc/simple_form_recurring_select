require 'test_helper'

module SimpleFormRecurringSelect
  describe HasRecurrenceRule do

    subject { MyDocument.new }

    # =====================================================================

    it { subject.must_respond_to :recurrence_rule }

    # ---------------------------------------------------------------------

    describe 'setting a rule from string' do
      let(:rule) { IceCube::Rule.daily(1).count(7) }
      let(:rule_string) { rule.to_json }

      it 'assigns rule to schedule' do
        subject.recurrence_rule = rule_string
        subject.recurrence_rule.must_equal rule
      end
    end

    # ---------------------------------------------------------------------

    describe 'setting nil' do
      it 'returns nil' do
        [ nil, 'null' ].each do |value|
          subject.recurrence_rule = value
          subject.recurrence_rule.must_be_nil
        end
      end
    end

  end
end
