defmodule LiveAdminIssue.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveAdminIssue.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        hidden: true,
        tags: ["option1", "option2"],
        title: "some title",
        view: 42
      })
      |> LiveAdminIssue.Posts.create_post()

    post
  end
end
