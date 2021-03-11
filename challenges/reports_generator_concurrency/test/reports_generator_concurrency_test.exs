defmodule ReportsGeneratorConcurrencyTest do
  use ExUnit.Case

  describe "build/1" do
    test "builds the report" do
      file_name = "gen_test.csv"

      response = ReportsGeneratorConcurrency.build(file_name)

      expected_response = %{
        "all_hours" => %{"cleiton" => 12, "daniele" => 21, "danilo" => 7, "diego" => 12, "giuliano" => 14, "jakeliny" => 14, "joseph" => 8, "mayk" => 19, "rafael" => 7},
        "hours_per_month" => %{"cleiton" => %{junho: 4, outubro: 8}, "daniele" => %{abril: 7, dezembro: 5, junho: 1, maio: 8}, "danilo" => %{abril: 1, fevereiro: 6}, "diego" => %{abril: 4, agosto: 4, dezembro: 1, setembro: 3}, "giuliano" => %{abril: 1, fevereiro: 9, maio: 4}, "jakeliny" => %{julho: 8, março: 6}, "joseph" => %{março: 3, novembro: 5}, "mayk" => %{dezembro: 5, julho: 7, setembro: 7}, "rafael" => %{julho: 7}},
        "hours_per_year" => %{"cleiton" => %{2016 => 3, 2020 => 9}, "daniele" => %{2016 => 10, 2017 => 3, 2018 => 7, 2020 => 1}, "danilo" => %{2018 => 1, 2019 => 6}, "diego" => %{2016 => 3, 2017 => 8, 2019 => 1}, "giuliano" => %{2017 => 3, 2019 => 6, 2020 => 5}, "jakeliny" => %{2017 => 8, 2019 => 6}, "joseph" => %{2017 => 3, 2020 => 5}, "mayk" => %{2016 => 7, 2017 => 8, 2019 => 4}, "rafael" => %{2017 => 7}}
      }

      assert response == expected_response
    end
  end
end
