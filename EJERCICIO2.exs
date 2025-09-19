defmodule Salas do
  @moduledoc """
  Lleva el control de las sillas disponibles por sala.
  """

  def reservar_sillas(salas, sala, cantidad) do
    cond do
      not Map.has_key?(salas, sala) ->
        IO.puts("Sala no encontrada")

      salas[sala] < cantidad ->
        IO.puts("No hay suficientes sillas disponibles")

      true ->
        nuevas = salas[sala] - cantidad
        nuevo_mapa = Map.put(salas, sala, nuevas)
        IO.inspect(nuevo_mapa, label: "Mapa actualizado")
    end
  end
end
