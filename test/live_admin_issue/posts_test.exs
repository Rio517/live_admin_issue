defmodule LiveAdminIssue.PostsTest do
  use LiveAdminIssue.DataCase

  alias LiveAdminIssue.Posts

  describe "posts" do
    alias LiveAdminIssue.Posts.Post

    import LiveAdminIssue.PostsFixtures

    @invalid_attrs %{hidden: nil, tags: nil, title: nil, view: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Posts.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Posts.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{hidden: true, tags: ["option1", "option2"], title: "some title", view: 42}

      assert {:ok, %Post{} = post} = Posts.create_post(valid_attrs)
      assert post.hidden == true
      assert post.tags == ["option1", "option2"]
      assert post.title == "some title"
      assert post.view == 42
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{hidden: false, tags: ["option1"], title: "some updated title", view: 43}

      assert {:ok, %Post{} = post} = Posts.update_post(post, update_attrs)
      assert post.hidden == false
      assert post.tags == ["option1"]
      assert post.title == "some updated title"
      assert post.view == 43
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_post(post, @invalid_attrs)
      assert post == Posts.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Posts.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Posts.change_post(post)
    end
  end
end
