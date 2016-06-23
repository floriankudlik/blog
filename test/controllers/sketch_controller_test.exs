defmodule Blog.SketchControllerTest do
  use Blog.ConnCase

  alias Blog.Sketch
  @valid_attrs %{link: "some content", text: "some content", tite: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, sketch_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing sketches"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, sketch_path(conn, :new)
    assert html_response(conn, 200) =~ "New sketch"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, sketch_path(conn, :create), sketch: @valid_attrs
    assert redirected_to(conn) == sketch_path(conn, :index)
    assert Repo.get_by(Sketch, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, sketch_path(conn, :create), sketch: @invalid_attrs
    assert html_response(conn, 200) =~ "New sketch"
  end

  test "shows chosen resource", %{conn: conn} do
    sketch = Repo.insert! %Sketch{}
    conn = get conn, sketch_path(conn, :show, sketch)
    assert html_response(conn, 200) =~ "Show sketch"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, sketch_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    sketch = Repo.insert! %Sketch{}
    conn = get conn, sketch_path(conn, :edit, sketch)
    assert html_response(conn, 200) =~ "Edit sketch"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    sketch = Repo.insert! %Sketch{}
    conn = put conn, sketch_path(conn, :update, sketch), sketch: @valid_attrs
    assert redirected_to(conn) == sketch_path(conn, :show, sketch)
    assert Repo.get_by(Sketch, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    sketch = Repo.insert! %Sketch{}
    conn = put conn, sketch_path(conn, :update, sketch), sketch: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit sketch"
  end

  test "deletes chosen resource", %{conn: conn} do
    sketch = Repo.insert! %Sketch{}
    conn = delete conn, sketch_path(conn, :delete, sketch)
    assert redirected_to(conn) == sketch_path(conn, :index)
    refute Repo.get(Sketch, sketch.id)
  end
end
