import Ecto.Query
import Jason
defmodule QueuerbackendWeb.QueueController do
  use QueuerbackendWeb, :controller
  alias Queuerbackend.{Repo,Queue}

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, _params) do
    fieldMap = [:name , :head, :queuers]
    query = from q in Queue, select: map( q , ^fieldMap)
    responseData = Repo.all(query)
    IO.inspect(responseData)

    json(conn,%{status: "200",response: responseData })
  end

  def create(conn, params) do
    query = from(q in Queue, where: [name: ^conn.params["name"]],select: fragment("count(*)"))
    [count] = Repo.all(query)
    if count==0 do
      changeset = Queue.changeset(%Queue{},%{name: params["name"], maxLength: params["maxLength"] , head: params["head"], queuers: String.split(params["queuers"],",")})
      IO.inspect(changeset)
      if changeset.valid? do
        Repo.insert(changeset)
        json(conn, %{status: "200", response: "Inserted"})
      else
        json(conn, %{status: "400", error: "Schema Mismatch"})
      end
    else
      json(conn, %{status: "400", error: "Queue Exists"})
    end
  end

end
