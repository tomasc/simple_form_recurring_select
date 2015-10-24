require "simple_form"

module SimpleFormRecurringSelect
  class RecurringSelectInput < SimpleForm::Inputs::Base

    def input wrapper_options
      template.content_tag :div, class: "inputs #{attribute_name}" do
        template.concat select_recurring_tag.html_safe
      end
    end

    private # =============================================================

    def select_recurring_tag
      @builder.select_recurring attribute_name, options[:default_schedules], options.slice(:allow_blank), { data: { recurring_select_position: options.fetch(:position, 'inline') } }
    end

  end
end
