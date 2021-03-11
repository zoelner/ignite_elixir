defmodule ReportsGeneratorParallelTest do
  use ExUnit.Case
  doctest ReportsGeneratorParallel

  describe "build_from_many/1" do
    test "when a list is provided, builds the report" do
      file_names = ["gen_test.csv", "gen_test.csv"]

      response = ReportsGeneratorParallel.build_from_many(file_names)

      expected_response =
        {:ok,
         %{
           "all_hours" => %{
             "cleiton" => 24,
             "daniele" => 42,
             "danilo" => 14,
             "diego" => 24,
             "giuliano" => 28,
             "jakeliny" => 28,
             "joseph" => 16,
             "mayk" => 38,
             "rafael" => 14
           },
           "hours_per_month" => %{
             "cleiton" => %{junho: 8, outubro: 16},
             "daniele" => %{abril: 14, dezembro: 10, junho: 2, maio: 16},
             "danilo" => %{abril: 2, fevereiro: 12},
             "diego" => %{abril: 8, agosto: 8, dezembro: 2, setembro: 6},
             "giuliano" => %{abril: 2, fevereiro: 18, maio: 8},
             "jakeliny" => %{julho: 16, março: 12},
             "joseph" => %{março: 6, novembro: 10},
             "mayk" => %{dezembro: 10, julho: 14, setembro: 14},
             "rafael" => %{julho: 14}
           },
           "hours_per_year" => %{
             "cleiton" => %{2016 => 6, 2020 => 18},
             "daniele" => %{2016 => 20, 2017 => 6, 2018 => 14, 2020 => 2},
             "danilo" => %{2018 => 2, 2019 => 12},
             "diego" => %{2016 => 6, 2017 => 16, 2019 => 2},
             "giuliano" => %{2017 => 6, 2019 => 12, 2020 => 10},
             "jakeliny" => %{2017 => 16, 2019 => 12},
             "joseph" => %{2017 => 6, 2020 => 10},
             "mayk" => %{2016 => 14, 2017 => 16, 2019 => 8},
             "rafael" => %{2017 => 14}
           }
         }}

      assert response == expected_response
    end
  end
end
