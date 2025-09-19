defmodule Envio do
  @moduledoc """
  Calcula el costo de envío según peso, tipo de cliente y tipo de servicio.
  """

  # ---- Determinar tarifa base por peso usando guards ----
  def tarifa_base(p) when p > 0 and p <= 1, do: 8000
  def tarifa_base(p) when p > 1 and p <= 5, do: 12000
  def tarifa_base(p) when p > 5, do: 20000

  # ---- Descuento según tipo de cliente (pattern matching con átomos) ----
  def descuento(:corporativo), do: 0.15
  def descuento(:estudiante), do: 0.10
  def descuento(:regular), do: 0.0

  # ---- Recargo según tipo de servicio ----
  def recargo(:express), do: 0.25
  def recargo(:estandar), do: 0.0

  # ---- Convertir números a átomos ----
  def tipo_cliente(1), do: :corporativo
  def tipo_cliente(2), do: :estudiante
  def tipo_cliente(3), do: :regular

  def tipo_servicio(1), do: :express
  def tipo_servicio(2), do: :estandar

  # ---- Calcular tarifa final ----
  def calcular(peso, tipo_cliente_num, tipo_servicio_num) do
    cliente = tipo_cliente(tipo_cliente_num)
    servicio = tipo_servicio(tipo_servicio_num)

    base = tarifa_base(peso)
    desc = base * descuento(cliente)
    subtotal = base - desc
    rec = subtotal * recargo(servicio)
    total = subtotal + rec

    IO.puts("Base: #{base}")
    IO.puts("Descuento: #{desc}")
    IO.puts("Subtotal: #{subtotal}")
    IO.puts("Recargo: #{rec}")
    IO.puts("Total: #{total}")
  end
end
