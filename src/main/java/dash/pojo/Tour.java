package dash.pojo;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import org.apache.commons.beanutils.BeanUtils;

import dash.dao.TourEntity;
import dash.security.IAclObject;

/**
* Plain class for handling a tour object.
* @author tabrown4@uh.edu
*
*/

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Tour implements  Serializable, IAclObject{
	
	@XmlElement(name = "tour_id")
	private Long tour_id;
	
	@XmlElement(name = "tour_title")
	private String tour_title;
	
	@XmlElement(name = "artwork_included")
	private String artwork_included;
	
	@XmlElement(name = "times_taken")
	private int times_taken;
	
	@XmlElement(name = "creator")
	private String creator;
	
	@XmlElement(name = "date_created")
	private String date_created;
	
	@XmlElement(name = "artistic_attributes")
	private String artistic_attributes;

	public Tour(Long tour_id, String tour_title, String artwork_included,
			int times_taken, String creator, String date_created,
			String artistic_attributes) {
		
		super();
		this.tour_id = tour_id;
		this.tour_title = tour_title;
		this.artwork_included = artwork_included;
		this.times_taken = times_taken;
		this.creator = creator;
		this.date_created = date_created;
		this.artistic_attributes = artistic_attributes;
	}
	
	public Tour(){}
	
	public Tour(TourEntity tourEntity) {
		try {
			BeanUtils.copyProperties(this, tourEntity);
		} catch ( IllegalAccessException e) {

			e.printStackTrace();
		} catch ( InvocationTargetException e) {

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

	@Override
	public Long getId() {
		return tour_id;
	}

}
