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
      response = Govtrack.bill(12700)
      assert response["id"] == 12700
      response["title_without_number"] == "Patient Protection and Affordable Care Act"
      response["current_status"] == "enacted_signed"
    end
  end

  test "retrieve all cosponsorships" do
    use_cassette "govtrack_cosponsorships" do
      assert Govtrack.cosponsorships["objects"]
    end
  end

  test "retrieve single cosponsorship with id" do
    use_cassette "govtrack_cosponsorship_3291427" do
      response = Govtrack.cosponsorship(3291427)
      assert response["id"] == 3291427
      assert response["bill"] == 346156
      assert response["person"] == 400158
    end
  end

  test "retrieve all persons" do
    use_cassette "govtrack_persons" do
      assert Govtrack.persons["objects"]
    end
  end

  test "retrieve single person with id" do
    use_cassette "govtrack_person_400629" do
      response = Govtrack.person(400629)
      assert response["id"] == 400629
      assert response["firstname"] == "Barack"
      assert response["lastname"] == "Obama"
    end
  end

  test "retrieve all roles" do
    use_cassette "govtrack_roles" do
      assert Govtrack.roles["objects"]
    end
  end

  test "retrieve single role with id" do
    use_cassette "govtrack_role_42929" do
      response = Govtrack.role(42929)
      assert response["id"] == 42929
      assert response["description"] == "Junior Senator from New York"
      assert response["person"]["name"] == "Sen. Kirsten Gillibrand [D-NY]"
    end
  end

  test "retrieve all votes" do
    use_cassette "govtrack_votes" do
      assert Govtrack.votes["objects"]
    end
  end

  test "retrieve single vote with id" do
    use_cassette "govtrack_vote_13969" do
      response = Govtrack.vote(13969)
      assert response["id"] == 13969
      assert response["question"] == "H.R. 3590 (111th): Patient Protection and Affordable Care Act"
      assert response["related_bill"]["id"] == 12700
    end
  end

  test "retrieve all vote_voters" do
    use_cassette "govtrack_vote_voters" do
      assert Govtrack.vote_voters["objects"]
    end
  end

  test "retrieve single vote_voter with id" do
    use_cassette "govtrack_vote_voter_31425718" do
      response = Govtrack.vote_voter(31425718)
      assert response["id"] == 31425718
      assert response["person"]["name"] == "Sen. Thom Tillis [R-NC]"
      assert response["vote"]["question"] == "Cloture on H.R. 2577: Military Construction, Veterans Affairs, and Related Agencies Appropriations Act, 2017"
    end
  end

  test "retrieve all committees" do
    use_cassette "govtrack_committees" do
      assert Govtrack.committees["objects"]
    end
  end

  test "retrieve single committee with id" do
    use_cassette "govtrack_committee_2650" do
      response = Govtrack.committee(2650)
      assert response["id"] == 2650
      assert response["name"] == "Senate Committee on the Judiciary"
    end
  end

  test "retrieve all committee_members" do
    use_cassette "govtrack_committee_members" do
      assert Govtrack.committee_members["objects"]
    end
  end

  test "retrieve single committee_member with id" do
    use_cassette "govtrack_committee_member_207975" do
      response = Govtrack.committee_member(207975)
      assert response["id"] == 207975
      assert response["committee"]["name"] == "Disability Assistance and Memorial Affairs"
      assert response["person"]["name"] == "Rep. Ralph Abraham [R-LA5]"
    end
  end

end
