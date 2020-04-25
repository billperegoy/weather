defmodule WeatherWeb.Feature.FirstTest do
  use WeatherWeb.FeatureCase, async: true

  import Wallaby.Query, only: [css: 2]

  test "landing page loads", %{session: session} do
    session
    |> visit("/")
    |> take_screenshot()
    |> find(css(".phx-hero", count: 1))
    |> assert_has(css(".header", text: "Welcome to Phoenix"))
  end
end
