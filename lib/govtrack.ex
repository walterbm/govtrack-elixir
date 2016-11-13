defmodule Govtrack do
  @moduledoc """
  Wrapper for the Govtrack.us API that provides programmatic access to information about the U.S. Congress
  """

  use HTTPoison.Base

  require IEx


  @api_url "https://www.govtrack.us/api/"
  @api_version "v2"

  def process_url(url) do
    "#{@api_url}#{@api_version}/" <> url
  end

  def process_response_body(body) do
    body |> Poison.decode!
  end

  defp request(url, options) do
    get(url, [], [params: options]) |> process_response
  end

  defp process_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    body
  end

  defp process_response({:error, %HTTPoison.Response{status_code: status_code, body: body}}) do
    { status_code, body }
  end

  @doc """
  Get information about a specific bill
  ## Example
      Govtrack.bill(12700)
  More info at: https://www.govtrack.us/developers/api#endpoint_bill
  """
  def bill(id, query \\ []) do
    request("bill/#{id}", Keyword.merge([sort: "-current_status_date"], query))
  end

  @doc """
  Get a list of all bills
  ## Example
      Govtrack.bills
  More info at: https://www.govtrack.us/developers/api#endpoint_bill
  """
  def bills(query \\ []) do
    request("bill", Keyword.merge([sort: "-current_status_date"], query))
  end

  @doc """
  Get information about a specific cosponsorship
  ## Example
      Govtrack.cosponsorship(3291427)
  More info at: https://www.govtrack.us/developers/api#endpoint_cosponsorship
  """
  def cosponsorship(id, query \\ []) do
    request("cosponsorship/#{id}", Keyword.merge([], query))
  end

  @doc """
  Get a list of all cosponsorships
  ## Example
      Govtrack.cosponsorships
  More info at: https://www.govtrack.us/developers/api#endpoint_cosponsorship
  """
  def cosponsorships(query \\ []) do
    request("cosponsorship", Keyword.merge([], query))
  end

  @doc """
  Get information about a specific person in U.S. Congress
  ## Example
      Govtrack.person(400629)
  More info at: https://www.govtrack.us/developers/api#endpoint_person
  """
  def person(id, query \\ []) do
    request("person/#{id}", Keyword.merge([], query))
  end

  @doc """
  Get a list of all persons in U.S. Congress
  ## Example
      Govtrack.persons
  More info at: https://www.govtrack.us/developers/api#endpoint_person
  """
  def persons(query \\ []) do
    request("person", Keyword.merge([], query))
  end

  @doc """
  Get information about a specific role
  ## Example
      Govtrack.role(42929)
  More info at: https://www.govtrack.us/developers/api#endpoint_role
  """
  def role(id, query \\ []) do
    request("role/#{id}", Keyword.merge([current: true], query))
  end

  @doc """
  Get a list of all roles
  ## Example
      Govtrack.roles
  More info at: https://www.govtrack.us/developers/api#endpoint_role
  """
  def roles(query \\ []) do
    request("role", Keyword.merge([current: true], query))
  end

  @doc """
  Get information about a specific vote
  ## Example
      Govtrack.vote(13969)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote
  """
  def vote(id, query \\ []) do
    request("vote/#{id}", Keyword.merge([order_by: "-created"], query))
  end

  @doc """
  Get a list of all votes
  ## Example
      Govtrack.votes
  More info at: https://www.govtrack.us/developers/api#endpoint_vote
  """
  def votes(query \\ []) do
    request("vote", Keyword.merge([order_by: "-created"], query))
  end

  @doc """
  Get information about how a specific voter voted on a roll call vote
  ## Example
      Govtrack.vote_voter(31425718)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote_voter
  """
  def vote_voter(id, query \\ []) do
    request("vote_voter/#{id}", Keyword.merge([order_by: "-created"], query))
  end

  @doc """
  Get a list of all voters in all roll call votes
  ## Example
      Govtrack.vote_voter(31425718)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote_voter
  """
  def vote_voters(query \\ []) do
    request("vote_voter", Keyword.merge([order_by: "-created"], query))
  end

  @doc """
  Get information about a specific committee
  ## Example
      Govtrack.committee(2650)
  More info at: https://www.govtrack.us/developers/api#endpoint_committee
  """
  def committee(id, query \\ []) do
    request("committee/#{id}", Keyword.merge([obsolete: false], query))
  end

  @doc """
  Get a list of all committees
  ## Example
      Govtrack.committees
  More info at: https://www.govtrack.us/developers/api#endpoint_committee
  """
  def committees(query \\ []) do
    request("committee", Keyword.merge([obsolete: false], query))
  end

  @doc """
  Get information about a specific committee member
  ## Example
      Govtrack.committee_member(207975)
  More info at: https://www.govtrack.us/developers/api#endpoint_committee_member
  """
  def committee_member(id, query \\ []) do
    request("committee_member/#{id}", Keyword.merge([], query))
  end

  @doc """
  Get a list of all committee members
  ## Example
      Govtrack.committee_members
  More info at: https://www.govtrack.us/developers/api#endpoint_committee_member
  """
  def committee_members(query \\ []) do
    request("committee_member", Keyword.merge([], query))
  end

end
