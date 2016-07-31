defmodule Govtrack do
  @moduledoc """
  Wrapper for the Govtrack.us API
  """
  alias GovtrackAPI

  def role() do
    GovtrackAPI.get("role")
  end
  
end
