defmodule Blog.Repo.Migrations.CreateSketch do
  use Ecto.Migration

  def change do
    alter table(:sketches) do
      remove :tite
      add :title, :string
    end
  end
end
