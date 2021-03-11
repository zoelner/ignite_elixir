defmodule ReportsGeneratorConcurrency do
  alias ReportsGeneratorConcurrency.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(),  &sum_values(&1, &2))
  end

  defp sum_values(line, %{ "all_hours" => all_hours, "hours_per_month" => hours_per_month, "hours_per_year" => hours_per_year }) do
    all_hours = accumulate_all_hours(line, all_hours)

    hours_per_month = accumulate_hours_per_month(line, hours_per_month)
    hours_per_year = accumulate_hours_per_year(line,hours_per_year)
    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp accumulate_all_hours([name, worked_hours | _], all_hours) do
    previous_hour = Map.get(all_hours, name, 0)
    Map.put(all_hours, name, previous_hour + worked_hours)
  end


  defp accumulate_hours_per_month([name, worked_hours, _day, month, _year], all_hours) do
    previous_name = Map.get(all_hours, name, %{})
    previous_month = Map.get(previous_name, month, 0)
    new_month = Map.put(previous_name, month, previous_month + worked_hours)

    Map.put(all_hours, name, new_month)
  end

  defp accumulate_hours_per_year([name, worked_hours, _day, _month, year], hours_per_year) do
    previous_name = Map.get(hours_per_year, name, %{})
    previous_year = Map.get(previous_name, year, 0)
    new_year = Map.put(previous_name, year, previous_year + worked_hours)

    Map.put(hours_per_year, name, new_year)
  end

  defp report_acc, do: %{"all_hours" => %{}, "hours_per_month" => %{}, "hours_per_year" => %{}}


  defp build_report( all_hours, hours_per_month, hours_per_year ) do
    %{ "all_hours" => all_hours, "hours_per_month" => hours_per_month, "hours_per_year" => hours_per_year }
  end
end
