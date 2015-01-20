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

import dash.pojo.Tour;

@Entity
@Table(name="tours")
public class TourEntity implements Serializable {

	@Id
	@GeneratedValue
	@Column(name = "tour_id")
	private Long tour_id;
	
	@Column(name = "tour_title")
	private String tour_title;
	
	@Column(name = "artwork_included")
	private String artwork_included;
	
	@Column(name = "times_taken")
	private int times_taken;
	
	@Column(name = "creator")
	private String creator;
	
	@Column(name = "date_created")
	private String date_created;
	
	@Column(name = "artistic_attributes")
	private String artistic_attributes;
	
	/** date of last update in the database */
	@Column(name = "last_update")
	private Date last_update;

	public TourEntity(Long tour_id, String tour_title, String artwork_included,
			int times_taken, String creator, String date_created,
			String artistic_attributes, Date last_update) {
		super();
		this.tour_id = tour_id;
		this.tour_title = tour_title;
		this.artwork_included = artwork_included;
		this.times_taken = times_taken;
		this.creator = creator;
		this.date_created = date_created;
		this.artistic_attributes = artistic_attributes;
		this.last_update = last_update;
	}

	public TourEntity(){}
	
	public TourEntity(Tour tour) {
		try {
			BeanUtils.copyProperties(this, tour);
		} catch ( IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch ( InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Long getTour_id() {
		return tour_id;
	}

	public void setTour_id(Long tour_id) {
		this.tour_id = tour_id;
	}

	public String getTour_title() {
		return tour_title;
	}

	public void setTour_title(String tour_title) {
		this.tour_title = tour_title;
	}

	public String getArtwork_included() {
		return artwork_included;
	}

	public void setArtwork_included(String artwork_included) {
		this.artwork_included = artwork_included;
	}

	public int getTimes_taken() {
		return times_taken;
	}

	public void setTimes_taken(int times_taken) {
		this.times_taken = times_taken;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getDate_created() {
		return date_created;
	}

	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}

	public String getArtistic_attributes() {
		return artistic_attributes;
	}

	public void setArtistic_attributes(String artistic_attributes) {
		this.artistic_attributes = artistic_attributes;
	}

	public Date getLast_update() {
		return last_update;
	}

	public void setLast_update(Date last_update) {
		this.last_update = last_update;
	}

	
}
