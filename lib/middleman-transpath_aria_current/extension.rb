require "middleman-core"

class AriaCurrent < ::Middleman::Extension
  FILE_EXTENSION = /\.(\w+)$/

  helpers do
    def current_link_to(*arguments, aria_current: "page", **options, &block)
      if block_given?
        text = capture(&block)
        path = arguments[0]
      else
        text = arguments[0]
        path = arguments[1]
      end

      options = options.with_indifferent_access
      current_path = current_page.data.slug

      if current_path == path.to_s
        options.merge!("aria-current" => aria_current)
      end

      t("paths.#{path}") != "" ? link_to(text, t("paths.#{path}"), options) : link_to(text, '/', options)
    end
    def is_current_path?(*args)
      args.each do |arg|
        if current_page.data.slug == arg
          return true
        end
      end
      return false
    end
  end
end
