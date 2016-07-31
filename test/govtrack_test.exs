defmodule GovtrackTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  doctest Govtrack

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes")
    :ok
  end

  test "retrieving bills" do
    use_cassette "govtrack_bills" do
      assert Govtrack.bills().body["objects"]
    end
  end

end
