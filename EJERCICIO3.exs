defmodule Password do
  @moduledoc """
  Valida que una contraseña cumpla TODAS estas reglas:
    - mínimo 8 caracteres
    - al menos una letra mayúscula
    - al menos un número
    - no contenga espacios
  """

  def validar(pass) do
    mayusculas = String.graphemes("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    numeros = String.graphemes("0123456789")
    letras = String.graphemes(pass)

    cond do
      String.length(pass) < 8 ->
        IO.puts("Debe tener mínimo 8 caracteres")

      Enum.all?(letras, fn l -> l != " " end) == false ->
        IO.puts("No debe contener espacios")

      Enum.any?(letras, fn l -> l in mayusculas end) == false ->
        IO.puts("Debe tener al menos una mayúscula")

      Enum.any?(letras, fn l -> l in numeros end) == false ->
        IO.puts("Debe tener al menos un número")

      true ->
        IO.puts("Contraseña segura")
    end
  end
end
