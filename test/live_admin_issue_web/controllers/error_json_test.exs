defmodule LiveAdminIssueWeb.ErrorJSONTest do
  use LiveAdminIssueWeb.ConnCase, async: true

  test "renders 404" do
    assert LiveAdminIssueWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert LiveAdminIssueWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
