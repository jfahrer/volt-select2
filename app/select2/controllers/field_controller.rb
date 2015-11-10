module Select2
  class FieldController < Volt::ModelController
    reactive_accessor :select_field

    def index_ready
      setup_select2_field
    end

    def multiple_ready
      setup_select2_field
    end

    private

    def setup_select2_field
      self.select_field = first_element
      -> do
        if attrs.options
          puts "updating field"
          `$(#{select_field}).select2(#{settings_from_attrs})`
        end
      end.watch!
    end

    def options
      attrs.options.then do |options|
        if options[0].is_a?(Hash)
          options_hash = options
        else
          options_hash = options.collect { |option| {value: option, label: option } }
        end
        options_hash
      end
    end

    def settings_from_attrs
      settings = `{}`
      `settings.placeholder = #{attrs.placeholder}`
      `settings.allowClear = true` if attrs.include_blank
      settings
    end

    def html_class
      classes = attrs.html_class.split(/\s+/)
      classes.uniq.join(' ')
    end

    def selected_value
      attrs.value.to_s
    end

    def selected_values
      if attrs.value.is_a?(String)
        attrs.value.split(/\s+,\s+/)
      else
        attrs.value.to_a
      end
    end

    def include_blank?
      attrs.include_blank ? true : false
    end
  end
end
