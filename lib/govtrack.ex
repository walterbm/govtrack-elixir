defmodule Govtrack do
  @moduledoc """
  Wrapper for the Govtrack.us API
  """

  use HTTPotion.Base

  @api_url "https://www.govtrack.us/api/"
  @api_version "v2/"

  def process_url(url) do
    "#{@api_url}#{@api_version}" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

end
