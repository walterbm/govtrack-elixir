defmodule GovtrackAPI do

  use HTTPotion.Base

  @api_url "https://www.govtrack.us/api/"
  @api_version "v2/"

  def process_url(url) do
    "#{@api_url}#{@api_version}" <> url
  end
  
end
