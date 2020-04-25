defmodule WeatherWeb.PageController do
  use WeatherWeb, :controller

  def index(conn, _params) do
    with {:ok, %{"main" => %{"temp" => temperature}}} <- Weather.OpenWeather.get("Boston") do
      IO.puts("Temperature: #{temperature}")
      render(conn, "index.html", temperature: temperature)
    end
  end
end
