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

  def bill(id, query \\ []) do
    get("bill/#{id}", query: Keyword.merge([congress: 114, order_by: "current_status_date"], query))
  end

  def bills(query \\ []) do
    get("bill", query: Keyword.merge([congress: 114, order_by: "current_status_date"], query))
  end

  def cosponsorship(id, query \\ []) do
    get("cosponsorship/#{id}", query: Keyword.merge([], query))
  end

  def cosponsorships(query \\ []) do
    get("cosponsorship", query: Keyword.merge([], query))
  end

  def person(id, query \\ []) do
    get("person/#{id}", query: Keyword.merge([], query))
  end

  def persons(query \\ []) do
    get("person", query: Keyword.merge([], query))
  end

  def role(id, query \\ []) do
    get("role/#{id}", query: Keyword.merge([current: true], query))
  end

  def roles(query \\ []) do
    get("role", query: Keyword.merge([current: true], query))
  end

  def vote(id, query \\ []) do
    get("vote/#{id}", query: Keyword.merge([order_by: "created"], query))
  end

  def votes(query \\ []) do
    get("vote", query: Keyword.merge([order_by: "created"], query))
  end

  def vote_voter(id, query \\ []) do
    get("vote_voter/#{id}", query: Keyword.merge([order_by: "created"], query))
  end

  def vote_voters(query \\ []) do
    get("vote_voter", query: Keyword.merge([order_by: "created"], query))
  end

  def committee(id, query \\ []) do
    get("committee/#{id}", query: Keyword.merge([obsolete: false], query))
  end

  def committees(query \\ []) do
    get("committee", query: Keyword.merge([obsolete: false], query))
  end

  def committee_member(id, query \\ []) do
    get("committee_member/#{id}", query: Keyword.merge([], query))
  end

  def committee_members(query \\ []) do
    get("committee_member", query: Keyword.merge([], query))
  end

end
