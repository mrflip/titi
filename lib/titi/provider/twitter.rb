module Titi::Provider
  module Twitter

    VERBS = %w[ install connect planning returning about_to_leave made_changes is_planning ].map(&:to_sym)

  end
end
