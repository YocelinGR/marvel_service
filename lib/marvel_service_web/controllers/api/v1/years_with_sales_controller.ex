defmodule MarvelServiceWeb.Api.V1.YearsWithSalesController do
  use MarvelServiceWeb, :controller

  alias MarvelService.Sales
  alias MarvelServiceWeb.Api.V1.YearsWithSalesControllerSchema

  action_fallback MarvelServiceWeb.Api.V1.FallbackController

  @spec years_with_sales(Plug.Conn.t(), map) :: {:bad_request, Ecto.Changeset} | Plug.Conn.t()
  def years_with_sales(conn, params) do
    company_number = List.first(get_req_header(conn, "company-number"))
    params = Map.put(params, "company_number", company_number)

    with {:ok, params} <- validate_schema(YearsWithSalesControllerSchema, params) do
      years_with_sales =
        Sales.get_years_with_sales(
          params.company_number,
          params.branch,
          params.client_id
        )

      render(conn, "years_with_sales.json", years_with_sales: years_with_sales)
    end
  end
end
