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

  def bill() do
    get("bill")
  end

  def cosponsorship() do
    get("cosponsorship")
  end

  def person() do
    get("person")
  end

  def role() do
    get("role")
  end

  def vote() do
    get("vote")
  end

  def vote_voter() do
    get("vote_voter")
  end

  def committee() do
    get("committee")
  end

  def committee_member() do
    get("committee_member")
  end

end
