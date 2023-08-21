defmodule LiveAdminIssue.Repo.Migrations.AddEmbeddedFieldToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :comments, {:array, :map}
    end
  end
end
