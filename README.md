# Govtrack

[![Build Status](https://travis-ci.org/walterbm/govtrack-elixir.svg?branch=master)](https://travis-ci.org/walterbm/govtrack-elixir) [![Hex.pm](https://img.shields.io/hexpm/v/govtrack.svg?maxAge=2592000?style=flat-square)](https://hex.pm/packages/govtrack)
# ⛔️ DEPRECATED ⛔️
_The GovTrack API was shutdown in December 2016_

---

An elixir wrapper for the [govtrack.us](https://www.govtrack.us/developers) API that provides programmatic access to information about the U.S. Congress.

## Installation

[Available through Hex](https://hex.pm/packages/govtrack), and can be installed by:

1. Adding `govtrack` to your list of dependencies in `mix.exs`:
```elixir
def deps do
  [{:govtrack, "~> 0.7.3"}]
end
```

2. Ensuring `govtrack` is initialized before your main elixir application:
```elixir
def application do
  [applications: [:govtrack]]
end
```

## Usage

This `Govtrack` module is meant to be a simple wrapper for the official [govtrack.us](https://www.govtrack.us/developers) API. The module automatically parses the JSON response and provides a few sensible defaults to common queries.

### Supported Endpoints:

- [bill](https://www.govtrack.us/developers/api#endpoint_bill)
- [cosponsorship](https://www.govtrack.us/developers/api#endpoint_cosponsorship)
- [person](https://www.govtrack.us/developers/api#endpoint_person)
- [role](https://www.govtrack.us/developers/api#endpoint_role)
- [vote](https://www.govtrack.us/developers/api#endpoint_vote)
- [vote_voter](https://www.govtrack.us/developers/api#endpoint_vote_voter)
- [committee](https://www.govtrack.us/developers/api#endpoint_committee)
- [committee_member](https://www.govtrack.us/developers/api#endpoint_committee_member)

### Basic Usage
```elixir
Govtrack.bills        #=> Fetch all bills, ordered by most recently updated

Govtrack.bill(12700)  #=> Fetch information about a specific bill
```

### Querying
An optional `query` parameter can be passed to all the supported endpoints to narrow the results. The specific query strings are dictated by the [govtrack API](https://www.govtrack.us/developers/api).

```elixir
Govtrack.roles([current: true, state: "NY"])    #=> Fetch all representatives for the State of New York.
```
