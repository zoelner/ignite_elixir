defmodule ListFilter do
  require Integer

  def call(list), do: filter(list)

  defp filter(list) do
    Enum.reduce(list, 0, fn item, acc ->
      item
      |> Integer.parse()
      |> getNumber()
      |> Integer.is_odd()
      |> count(acc)
    end)
  end

  defp count(false, acc), do: acc

  defp count(true, acc), do: acc = acc + 1

  defp getNumber(:error), do: false

  defp getNumber({result, _trash}), do: result
end
