defmodule Weather.OpenWeather do
  # api.openweathermap.org/data/2.5/weather?q=Boston&appid=cff9290c3196d68397376faf2c8109b3
  #
  def temperature(city) do
    kelvin_temp =
      city
      |> get()
      |> get_in(["main", "temp"])

    (kelvin_temp - 273.15) * 9 / 5 + 32
  end

  @spec get(String.t()) :: {:ok, map}
  def get(city) do
    with %HTTPoison.Response{body: body, status_code: 200} <- HTTPoison.get!(city_url(city)),
         {:ok, result} <- Jason.decode(body) do
      result
    end
  end

  def city_url(city) do
    "#{base_url()}?q=#{city}&appid=#{api_key()}"
  end

  def base_url() do
    "api.openweathermap.org/data/2.5/weather"
  end

  def api_key() do
    "cff9290c3196d68397376faf2c8109b3"
  end
end
