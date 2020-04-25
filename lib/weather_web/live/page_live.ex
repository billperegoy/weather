defmodule WeatherWeb.PageLive do
  use WeatherWeb, :live_view

  def render(assigns) do
    ~L"""
    <div>
      <h2>Hello LiveView</h2>
      <h2>Temperature: <%= @temperature %> </h2>
      <button phx-click="get_weather">Get Weather</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :temperature, temperature())}
  end

  def handle_event("get_weather", _params, socket) do
    IO.puts("handle event")

    temperature =
      "Boston"
      |> Weather.OpenWeather.get()
      |> get_in(["main", "temp"])

    {:noreply, assign(socket, :temperature, temperature())}
  end

  def temperature() do
    Weather.OpenWeather.temperature("Boston")
  end
end
