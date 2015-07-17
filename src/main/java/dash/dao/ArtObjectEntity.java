package dash.dao;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.beanutils.BeanUtils;

import dash.pojo.ArtObject;

/**
 * ArtObject entity
 * @author plindner
 *
 */
@Entity
@Table(name="artwork")
public class ArtObjectEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1081147088439882441L;

	/** id of the object */
	@Id
	@GeneratedValue
	@Column(name="artwork_id")
	private Long artwork_id;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "availability")
	private String availability;
	
	@Column(name = "location_lat")
	private BigDecimal location_lat;
	
	@Column(name = "location_long")
	private BigDecimal location_long;
	
	@Column(name = "artist_name")
	private String artist_name;
	
	@Column(name = "artist_dob")
	private String artist_dob;
	
	@Column(name = "artist_pob")
	private String artist_pob;
	
	@Column(name = "medium")
	private String medium;
	
	@Column(name = "artist_website")
	private String artist_website;
	
	@Column(name = "dimensions")
	private String dimensions;
	
	@Column(name = "date_made")
	private String date_made;
	
	@Column(name = "mon_value")
	private int mon_value;
	
	@Column(name = "location_campus")
	private String location_campus;
	
	@Column(name = "location_name")
	private String location_name;
	
	@Column(name = "indoor")
	private boolean indoor;
	
	@Column(name = "counter")
	private int counter;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "shape")
	private String shape;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "art_movement")
	private String art_movement;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "image")
	private String image;
	
	@Column(name = "tags")
	private String tags;
	
	/** date of last update in the database */
	@Column(name = "last_update")
	private Date last_update;
	
	

	public ArtObjectEntity(){}

	public ArtObjectEntity(Long artwork_id, String title, String availability,
			BigDecimal location_lat, BigDecimal location_long,
			String artist_name, String artist_dob, String artist_pob,
			String medium, String artist_website, String dimensions,
			String date_made, int mon_value, String location_campus,
			String location_name, boolean indoor, int counter, String type,
			String shape, String color, String art_movement,
			String description, String image, String tags, Date last_update) {
		super();
		this.artwork_id = artwork_id;
		this.title = title;
		this.availability = availability;
		this.location_lat = location_lat;
		this.location_long = location_long;
		this.artist_name = artist_name;
		this.artist_dob = artist_dob;
		this.artist_pob = artist_pob;
		this.medium = medium;
		this.artist_website = artist_website;
		this.dimensions = dimensions;
		this.date_made = date_made;
		this.mon_value = mon_value;
		this.location_campus = location_campus;
		this.location_name = location_name;
		this.indoor = indoor;
		this.counter = counter;
		this.type = type;
		this.shape = shape;
		this.color = color;
		this.art_movement = art_movement;
		this.description = description;
		this.image = image;
		this.tags = tags;
		this.last_update = last_update;
	}

	public ArtObjectEntity(ArtObject artObject) {
		try {
			BeanUtils.copyProperties(this, artObject);
		} catch ( IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch ( InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Long getArtwork_id() {
		return artwork_id;
	}

	public void setArtwork_id(Long artwork_id) {
		this.artwork_id = artwork_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public BigDecimal getLocation_lat() {
		return location_lat;
	}

	public void setLocation_lat(BigDecimal location_lat) {
		this.location_lat = location_lat;
	}

	public BigDecimal getLocation_long() {
		return location_long;
	}

	public void setLocation_long(BigDecimal location_long) {
		this.location_long = location_long;
	}

	public String getArtist_name() {
		return artist_name;
	}

	public void setArtist_name(String artist_name) {
		this.artist_name = artist_name;
	}

	public String getArtist_dob() {
		return artist_dob;
	}

	public void setArtist_dob(String artist_dob) {
		this.artist_dob = artist_dob;
	}

	public String getArtist_pob() {
		return artist_pob;
	}

	public void setArtist_pob(String artist_pob) {
		this.artist_pob = artist_pob;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getArtist_website() {
		return artist_website;
	}

	public void setArtist_website(String artist_website) {
		this.artist_website = artist_website;
	}

	public String getDimensions() {
		return dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	public String getDate_made() {
		return date_made;
	}

	public void setDate_made(String date_made) {
		this.date_made = date_made;
	}

	public int getMon_value() {
		return mon_value;
	}

	public void setMon_value(int mon_value) {
		this.mon_value = mon_value;
	}

	public String getLocation_campus() {
		return location_campus;
	}

	public void setLocation_campus(String location_campus) {
		this.location_campus = location_campus;
	}

	public String getLocation_name() {
		return location_name;
	}

	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public boolean isIndoor() {
		return indoor;
	}

	public void setIndoor(boolean indoor) {
		this.indoor = indoor;
	}

	public int getCounter() {
		return counter;
	}

	public void setCounter(int counter) {
		this.counter = counter;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getShape() {
		return shape;
	}

	public void setShape(String shape) {
		this.shape = shape;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getArt_movement() {
		return art_movement;
	}

	public void setArt_movement(String art_movement) {
		this.art_movement = art_movement;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public Date getLast_update() {
		return last_update;
	}

	public void setLast_update(Date last_update) {
		this.last_update = last_update;
	}
}
