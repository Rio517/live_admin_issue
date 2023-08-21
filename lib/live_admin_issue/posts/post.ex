defmodule LiveAdminIssue.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  use LiveAdmin.Resource

  schema "posts" do
    field :hidden, :boolean, default: false
    field :tags, {:array, Ecto.Enum}, values: [:option1, :option2, :option3]
    field :title, :string
    field :view, :integer

    embeds_many :comments, Comment do
      field :body, :string
      field :user, :string
      field :tags, {:array, Ecto.Enum}, values: [:tag1, :tag2, :tag3]
    end

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :hidden, :view, :tags])
    |> validate_required([:title, :hidden, :view, :tags])
  end
end
