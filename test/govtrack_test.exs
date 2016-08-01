defmodule GovtrackTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock

  doctest Govtrack

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes")
    :ok
  end

  test "retrieve all bills" do
    use_cassette "govtrack_bills" do
      assert Govtrack.bills["objects"]
    end
  end

  test "retrieve single bill with id" do
    use_cassette "govtrack_bill_12700" do
      assert Govtrack.bill(12700)["id"] == 12700
    end
  end

  test "retrieve all cosponsorships" do
    use_cassette "govtrack_cosponsorships" do
      assert Govtrack.cosponsorships["objects"]
    end
  end

  test "retrieve single cosponsorship with id" do
    use_cassette "govtrack_cosponsorship_3291427" do
      assert Govtrack.cosponsorship(3291427)["id"] == 3291427
    end
  end

  test "retrieve all persons" do
    use_cassette "govtrack_persons" do
      assert Govtrack.persons["objects"]
    end
  end

  test "retrieve single person with id" do
    use_cassette "govtrack_person_400629" do
      assert Govtrack.person(400629)["id"] == 400629
    end
  end

  test "retrieve all roles" do
    use_cassette "govtrack_roles" do
      assert Govtrack.roles["objects"]
    end
  end

  test "retrieve single role with id" do
    use_cassette "govtrack_role_42929" do
      assert Govtrack.role(42929)["id"] == 42929
    end
  end

  test "retrieve all votes" do
    use_cassette "govtrack_votes" do
      assert Govtrack.votes["objects"]
    end
  end

  test "retrieve single vote with id" do
    use_cassette "govtrack_vote_13969" do
      assert Govtrack.vote(13969)["id"] == 13969
    end
  end

  test "retrieve all vote_voters" do
    use_cassette "govtrack_vote_voters" do
      assert Govtrack.vote_voters["objects"]
    end
  end

  test "retrieve single vote_voter with id" do
    use_cassette "govtrack_vote_voter_31425718" do
      assert Govtrack.vote_voter(31425718)["id"] == 31425718
    end
  end

  test "retrieve all committees" do
    use_cassette "govtrack_committees" do
      assert Govtrack.committees["objects"]
    end
  end

  test "retrieve single committee with id" do
    use_cassette "govtrack_committee_2650" do
      assert Govtrack.committee(2650)["id"] == 2650
    end
  end

  test "retrieve all committee_members" do
    use_cassette "govtrack_committee_members" do
      assert Govtrack.committee_members["objects"]
    end
  end

  test "retrieve single committee_member with id" do
    use_cassette "govtrack_committee_member_207975" do
      assert Govtrack.committee_member(207975)["id"] == 207975
    end
  end

end
