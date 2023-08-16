defmodule LiveAdminIssue.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :hidden, :boolean, default: false, null: false
      add :view, :integer
      add :tags, {:array, :string}

      timestamps()
    end
  end
end
