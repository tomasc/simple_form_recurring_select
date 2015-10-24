require "simple_form_recurring_select/has_recurrence_rule"
require "simple_form_recurring_select/recurring_select_input"
require "simple_form_recurring_select/version"

# ---------------------------------------------------------------------

module SimpleForm
  class FormBuilder
    map_type :recurring_select, to: SimpleFormRecurringSelect::RecurringSelectInput
  end
end
