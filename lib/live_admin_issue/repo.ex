defmodule LiveAdminIssue.Repo do
  use Ecto.Repo,
    otp_app: :live_admin_issue,
    adapter: Ecto.Adapters.Postgres
end
