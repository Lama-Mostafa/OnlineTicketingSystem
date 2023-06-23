package classes;


public class PartyClass {
	
	String partyName;
	String place, artist, datee;
	public PartyClass()
	{
		
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getDate() {
		return datee;
	}

	public void setDate(String date) {
	    System.out.println("Setting Date: " + date);
		this.datee = date;
	}
	
	}

	

