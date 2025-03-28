module ActionViewTestHelpers
  def render_in_table(partial:, locals: {})
    locals_assignments = locals.map { |k, _| "#{k}: #{k}" }.join(", ")

    render inline: <<~ERB, locals: locals
      <table>
        <%= render partial: "#{partial}", locals: { #{locals_assignments} } %>
      </table>
    ERB
  end
end
