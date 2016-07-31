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

  def role() do
    get("role")
  end

end
