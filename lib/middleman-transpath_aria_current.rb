require "middleman-core"

Middleman::Extensions.register :transpath_aria_current do
  require "middleman-transpath_aria_current/extension"
  AriaCurrent
end
