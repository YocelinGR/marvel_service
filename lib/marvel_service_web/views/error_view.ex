defmodule MarvelServiceWeb.ErrorView do
  use MarvelServiceWeb, :view

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("404.json", _error) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: "Resource not found"}
  end

  def render("invalid_enum.json", %{field: field, value: value}) do
    %{errors: "Field #{field} has an invalid value #{value} please read the docs."}
  end
end
