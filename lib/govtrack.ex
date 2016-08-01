defmodule Govtrack do
  @moduledoc """
  Wrapper for the Govtrack.us API that provides programmatic access to information about the U.S. Congress
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

  @doc """
  Get information about a specific bill
  ## Example
      Govtrack.bill(12700)
  More info at: https://www.govtrack.us/developers/api#endpoint_bill
  """
  def bill(id, query \\ []) do
    get("bill/#{id}", query: Keyword.merge([congress: 114, order_by: "current_status_date"], query))
  end

  @doc """
  Get a list of all bills
  ## Example
      Govtrack.bills
  More info at: https://www.govtrack.us/developers/api#endpoint_bill
  """
  def bills(query \\ []) do
    get("bill", query: Keyword.merge([congress: 114, order_by: "current_status_date"], query))
  end

  @doc """
  Get information about a specific cosponsorship
  ## Example
      Govtrack.cosponsorship(3291427)
  More info at: https://www.govtrack.us/developers/api#endpoint_cosponsorship
  """
  def cosponsorship(id, query \\ []) do
    get("cosponsorship/#{id}", query: Keyword.merge([], query))
  end

  @doc """
  Get a list of all cosponsorships
  ## Example
      Govtrack.cosponsorships
  More info at: https://www.govtrack.us/developers/api#endpoint_cosponsorship
  """
  def cosponsorships(query \\ []) do
    get("cosponsorship", query: Keyword.merge([], query))
  end

  @doc """
  Get information about a specific person in U.S. Congress
  ## Example
      Govtrack.person(400629)
  More info at: https://www.govtrack.us/developers/api#endpoint_person
  """
  def person(id, query \\ []) do
    get("person/#{id}", query: Keyword.merge([], query))
  end

  @doc """
  Get a list of all persons in U.S. Congress
  ## Example
      Govtrack.persons
  More info at: https://www.govtrack.us/developers/api#endpoint_person
  """
  def persons(query \\ []) do
    get("person", query: Keyword.merge([], query))
  end

  @doc """
  Get information about a specific role
  ## Example
      Govtrack.role(42929)
  More info at: https://www.govtrack.us/developers/api#endpoint_role
  """
  def role(id, query \\ []) do
    get("role/#{id}", query: Keyword.merge([current: true], query))
  end

  @doc """
  Get a list of all roles
  ## Example
      Govtrack.roles
  More info at: https://www.govtrack.us/developers/api#endpoint_role
  """
  def roles(query \\ []) do
    get("role", query: Keyword.merge([current: true], query))
  end

  @doc """
  Get information about a specific vote
  ## Example
      Govtrack.vote(13969)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote
  """
  def vote(id, query \\ []) do
    get("vote/#{id}", query: Keyword.merge([order_by: "created"], query))
  end

  @doc """
  Get a list of all votes
  ## Example
      Govtrack.votes
  More info at: https://www.govtrack.us/developers/api#endpoint_vote
  """
  def votes(query \\ []) do
    get("vote", query: Keyword.merge([order_by: "created"], query))
  end

  @doc """
  Get information about how a specific voter voted on a roll call vote
  ## Example
      Govtrack.vote_voter(31425718)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote_voter
  """
  def vote_voter(id, query \\ []) do
    get("vote_voter/#{id}", query: Keyword.merge([order_by: "created"], query))
  end

  @doc """
  Get a list of all voters in all roll call votes
  ## Example
      Govtrack.vote_voter(31425718)
  More info at: https://www.govtrack.us/developers/api#endpoint_vote_voter
  """
  def vote_voters(query \\ []) do
    get("vote_voter", query: Keyword.merge([order_by: "created"], query))
  end

  @doc """
  Get information about a specific committee
  ## Example
      Govtrack.committee(2650)
  More info at: https://www.govtrack.us/developers/api#endpoint_committee
  """
  def committee(id, query \\ []) do
    get("committee/#{id}", query: Keyword.merge([obsolete: false], query))
  end

  @doc """
  Get a list of all committees
  ## Example
      Govtrack.committees
  More info at: https://www.govtrack.us/developers/api#endpoint_committee
  """
  def committees(query \\ []) do
    get("committee", query: Keyword.merge([obsolete: false], query))
  end

  @doc """
  Get information about a specific committee member
  ## Example
      Govtrack.committee_member(207975)
  More info at: https://www.govtrack.us/developers/api#endpoint_committee_member
  """
  def committee_member(id, query \\ []) do
    get("committee_member/#{id}", query: Keyword.merge([], query))
  end

  @doc """
  Get a list of all committee members
  ## Example
      Govtrack.committee_members
  More info at: https://www.govtrack.us/developers/api#endpoint_committee_member
  """
  def committee_members(query \\ []) do
    get("committee_member", query: Keyword.merge([], query))
  end

end
