defmodule Govtrack do
  @moduledoc """
  Wrapper for the Govtrack.us API
  """

  use HTTPotion.Base

  @api_url "https://www.govtrack.us/api/"
  @api_version "v2"

  def process_url(url) do
    "#{@api_url}#{@api_version}/" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

  def bill(query \\ %{congress: 114, order_by: "current_status_date"}) do
    get("bill", query: query)
  end

  def cosponsorship(query \\ %{}) do
    get("cosponsorship")
  end

  def person(query \\ %{}) do
    get("person", query: query)
  end

  def role(query \\ %{current: true}) do
    get("role", query: query)
  end

  def vote(query \\ %{order_by: "created"}) do
    get("vote", query: query)
  end

  def vote_voter(query \\ %{order_by: "created"}) do
    get("vote_voter", query: query)
  end

  def committee(query \\ %{obsolete: false}) do
    get("committee", query: query)
  end

  def committee_member(query \\ %{}) do
    get("committee_member", query: query)
  end

end
