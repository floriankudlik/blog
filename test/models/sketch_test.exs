defmodule Blog.SketchTest do
  use Blog.ModelCase

  alias Blog.Sketch

  @valid_attrs %{link: "some content", text: "some content", tite: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Sketch.changeset(%Sketch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Sketch.changeset(%Sketch{}, @invalid_attrs)
    refute changeset.valid?
  end
end
