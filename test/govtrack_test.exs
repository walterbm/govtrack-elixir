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
      assert Govtrack.bills.body["objects"]
    end
  end

  test "retrieve single bill with id" do
    use_cassette "govtrack_bill_12700" do
      assert Govtrack.bill(12700).body["id"] == 12700
    end
  end

  test "retrieve all cosponsorships" do
    use_cassette "govtrack_cosponsorships" do
      assert Govtrack.cosponsorships.body["objects"]
    end
  end

  test "retrieve single cosponsorship with id" do
    use_cassette "govtrack_cosponsorship_3291427" do
      assert Govtrack.cosponsorship(3291427).body["id"] == 3291427
    end
  end

  test "retrieve all persons" do
    use_cassette "govtrack_persons" do
      assert Govtrack.persons.body["objects"]
    end
  end

  test "retrieve single person with id" do
    use_cassette "govtrack_person_400629" do
      assert Govtrack.person(400629).body["id"] == 400629
    end
  end

  test "retrieve all roles" do
    use_cassette "govtrack_roles" do
      assert Govtrack.roles.body["objects"]
    end
  end

  test "retrieve single role with id" do
    use_cassette "govtrack_role_42929" do
      assert Govtrack.role(42929).body["id"] == 42929
    end
  end

  test "retrieve all votes" do
    use_cassette "govtrack_votes" do
      assert Govtrack.votes.body["objects"]
    end
  end

  test "retrieve single vote with id" do
    use_cassette "govtrack_vote_13969" do
      assert Govtrack.vote(13969).body["id"] == 13969
    end
  end

  test "retrieve all vote_voters" do
    use_cassette "govtrack_vote_voters" do
      assert Govtrack.vote_voters.body["objects"]
    end
  end

  test "retrieve single vote_voter with id" do
    use_cassette "govtrack_vote_voter_31425718" do
      assert Govtrack.vote_voter(31425718).body["id"] == 31425718
    end
  end

  test "retrieve all committees" do
    use_cassette "govtrack_committees" do
      assert Govtrack.committees.body["objects"]
    end
  end

  test "retrieve single committee with id" do
    use_cassette "govtrack_committee_2650" do
      assert Govtrack.committee(2650).body["id"] == 2650
    end
  end

  test "retrieve all committee_members" do
    use_cassette "govtrack_committee_members" do
      assert Govtrack.committee_members.body["objects"]
    end
  end

  test "retrieve single committee_member with id" do
    use_cassette "govtrack_committee_member_207975" do
      assert Govtrack.committee_member(207975).body["id"] == 207975
    end
  end

end
