defmodule GovtrackTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  doctest Govtrack

  setup_all do
    ExVCR.Config.cassette_library_dir("test/fixtures/vcr_cassettes")
    :ok
  end

  test "retrieve all bills" do
    use_cassette "govtrack_bills" do
      {:ok, response} = Govtrack.bills
      assert response.body["objects"]
    end
  end

  test "retrieve single bill with id" do
    use_cassette "govtrack_bill_12700" do
      {:ok, response} = Govtrack.bill(12700)
      assert response.body["id"] == 12700
      assert response.body["title_without_number"] == "Patient Protection and Affordable Care Act"
      assert response.body["current_status"] == "enacted_signed"
    end
  end

  test "retrieve all cosponsorships" do
    use_cassette "govtrack_cosponsorships" do
      {:ok, response} = Govtrack.cosponsorships
      assert response.body["objects"]
    end
  end

  test "retrieve single cosponsorship with id" do
    use_cassette "govtrack_cosponsorship_3291427" do
      {:ok, response} = Govtrack.cosponsorship(3291427)
      assert response.body["id"] == 3291427
      assert response.body["bill"] == 346156
      assert response.body["person"] == 400158
    end
  end

  test "retrieve all persons" do
    use_cassette "govtrack_persons" do
      {:ok, response} = Govtrack.persons
      assert response.body["objects"]
    end
  end

  test "retrieve single person with id" do
    use_cassette "govtrack_person_400629" do
      {:ok, response} = Govtrack.person(400629)
      assert response.body["id"] == 400629
      assert response.body["firstname"] == "Barack"
      assert response.body["lastname"] == "Obama"
    end
  end

  test "retrieve all roles" do
    use_cassette "govtrack_roles" do
      {:ok, response} = Govtrack.roles
      assert response.body["objects"]
    end
  end

  test "retrieve single role with id" do
    use_cassette "govtrack_role_42929" do
      {:ok, response} = Govtrack.role(42929)
      assert response.body["id"] == 42929
      assert response.body["description"] == "Junior Senator from New York"
      assert response.body["person"]["name"] == "Sen. Kirsten Gillibrand [D-NY]"
    end
  end

  test "retrieve all votes" do
    use_cassette "govtrack_votes" do
      {:ok, response} = Govtrack.votes
      assert response.body["objects"]
    end
  end

  test "retrieve single vote with id" do
    use_cassette "govtrack_vote_13969" do
      {:ok, response} = Govtrack.vote(13969)
      assert response.body["id"] == 13969
      assert response.body["question"] == "H.R. 3590 (111th): Patient Protection and Affordable Care Act"
      assert response.body["related_bill"]["id"] == 12700
    end
  end

  test "retrieve all vote_voters" do
    use_cassette "govtrack_vote_voters" do
      {:ok, response } = Govtrack.vote_voters
      assert response.body["objects"]
    end
  end

  test "retrieve single vote_voter with id" do
    use_cassette "govtrack_vote_voter_31425718" do
      {:ok, response} = Govtrack.vote_voter(31425718)
      assert response.body["id"] == 31425718
      assert response.body["person"]["name"] == "Sen. Thom Tillis [R-NC]"
      assert response.body["vote"]["question"] == "Cloture on H.R. 2577: Military Construction, Veterans Affairs, and Related Agencies Appropriations Act, 2017"
    end
  end

  test "retrieve all committees" do
    use_cassette "govtrack_committees" do
      {:ok, response} = Govtrack.committees
      assert response.body["objects"]
    end
  end

  test "retrieve single committee with id" do
    use_cassette "govtrack_committee_2650" do
      {:ok, response} = Govtrack.committee(2650)
      assert response.body["id"] == 2650
      assert response.body["name"] == "Senate Committee on the Judiciary"
    end
  end

  test "retrieve all committee_members" do
    use_cassette "govtrack_committee_members" do
      {:ok, response} = Govtrack.committee_members
      assert response.body["objects"]
    end
  end

  test "retrieve single committee_member with id" do
    use_cassette "govtrack_committee_member_207975" do
      {:ok, response} = Govtrack.committee_member(207975)
      assert response.body["id"] == 207975
      assert response.body["committee"]["name"] == "Disability Assistance and Memorial Affairs"
      assert response.body["person"]["name"] == "Rep. Ralph Abraham [R-LA5]"
    end
  end

end
