defmodule Blog.SketchController do
  use Blog.Web, :controller

  alias Blog.Sketch

  plug :scrub_params, "sketch" when action in [:create, :update]

  def index(conn, _params) do
    sketches = Repo.all(Sketch)
    render(conn, "index.html", sketches: sketches)
  end
"""
  def new(conn, _params) do
    changeset = Sketch.changeset(%Sketch{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sketch" => sketch_params}) do
    changeset = Sketch.changeset(%Sketch{}, sketch_params)

    case Repo.insert(changeset) do
      {:ok, _sketch} ->
        conn
        |> put_flash(:info, "Sketch created successfully.")
        |> redirect(to: sketch_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
"""
  def show(conn, %{"id" => id}) do
    sketch = Repo.get!(Sketch, id)
    render(conn, "show.html", sketch: sketch)
  end
"""
  def edit(conn, %{"id" => id}) do
    sketch = Repo.get!(Sketch, id)
    changeset = Sketch.changeset(sketch)
    render(conn, "edit.html", sketch: sketch, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sketch" => sketch_params}) do
    sketch = Repo.get!(Sketch, id)
    changeset = Sketch.changeset(sketch, sketch_params)

    case Repo.update(changeset) do
      {:ok, sketch} ->
        conn
        |> put_flash(:info, "Sketch updated successfully.")
        |> redirect(to: sketch_path(conn, :show, sketch))
      {:error, changeset} ->
        render(conn, "edit.html", sketch: sketch, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sketch = Repo.get!(Sketch, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(sketch)

    conn
    |> put_flash(:info, "Sketch deleted successfully.")
    |> redirect(to: sketch_path(conn, :index))
  end
"""
end
