defmodule LiveAdminIssue.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :hidden, :boolean, default: false
    field :tags, {:array, :string}
    field :title, :string
    field :view, :integer

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :hidden, :view, :tags])
    |> validate_required([:title, :hidden, :view, :tags])
  end
end
