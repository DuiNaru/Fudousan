package com.real.fudousan.agency.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.real.fudousan.entry.vo.Entry;
import com.real.fudousan.estate.vo.TransType;
import com.real.fudousan.member.vo.Member;

/**
 * 부동산중개사무소 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Agency implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** AGENCY_ID. */
	private Integer agencyId;

	/** 회원. */
	private Member member;

	/** 중개소이름. */
	private String name;

	/** 사업번호. */
	private String biznum;

	/** 주소 대분류. */
	private String addressMain;

	/** 주소 중분류. */
	private String addressMiddle;

	/** 주소 소분류. */
	private String addressSmall;

	/** 주소 상세. */
	private String addressSub;

	/** 설명. */
	private String text;

	/** 거래 유형. */
	private TransType transType;

	/** CONFIRM. */
	private Integer confirm;

	/** DATE. */
	private Date creDate;

	/** DEL_DATE. */
	private Date delDate;

	/** GPS_X. */
	private Integer gpsX;

	/** GPS_Y. */
	private Integer gpsY;

	public Integer getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBiznum() {
		return biznum;
	}

	public void setBiznum(String biznum) {
		this.biznum = biznum;
	}

	public String getAddressMain() {
		return addressMain;
	}

	public void setAddressMain(String addressMain) {
		this.addressMain = addressMain;
	}

	public String getAddressMiddle() {
		return addressMiddle;
	}

	public void setAddressMiddle(String addressMiddle) {
		this.addressMiddle = addressMiddle;
	}

	public String getAddressSmall() {
		return addressSmall;
	}

	public void setAddressSmall(String addressSmall) {
		this.addressSmall = addressSmall;
	}

	public String getAddressSub() {
		return addressSub;
	}

	public void setAddressSub(String addressSub) {
		this.addressSub = addressSub;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public TransType getTransType() {
		return transType;
	}

	public void setTransType(TransType transType) {
		this.transType = transType;
	}

	public Integer getConfirm() {
		return confirm;
	}

	public void setConfirm(Integer confirm) {
		this.confirm = confirm;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Integer getGpsX() {
		return gpsX;
	}

	public void setGpsX(Integer gpsX) {
		this.gpsX = gpsX;
	}

	public Integer getGpsY() {
		return gpsY;
	}

	public void setGpsY(Integer gpsY) {
		this.gpsY = gpsY;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Agency() {
		super();
	}

	public Agency(Integer agencyId, Member member, String name, String biznum, String addressMain, String addressMiddle,
			String addressSmall, String addressSub, String text, TransType transType, Integer confirm, Date creDate,
			Date delDate, Integer gpsX, Integer gpsY) {
		super();
		this.agencyId = agencyId;
		this.member = member;
		this.name = name;
		this.biznum = biznum;
		this.addressMain = addressMain;
		this.addressMiddle = addressMiddle;
		this.addressSmall = addressSmall;
		this.addressSub = addressSub;
		this.text = text;
		this.transType = transType;
		this.confirm = confirm;
		this.creDate = creDate;
		this.delDate = delDate;
		this.gpsX = gpsX;
		this.gpsY = gpsY;
	}

	@Override
	public String toString() {
		return "Agency [agencyId=" + agencyId + ", member=" + member + ", name=" + name + ", biznum=" + biznum
				+ ", addressMain=" + addressMain + ", addressMiddle=" + addressMiddle + ", addressSmall=" + addressSmall
				+ ", addressSub=" + addressSub + ", text=" + text + ", transType=" + transType + ", confirm=" + confirm
				+ ", creDate=" + creDate + ", delDate=" + delDate + ", gpsX=" + gpsX + ", gpsY=" + gpsY + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((agencyId == null) ? 0 : agencyId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Agency other = (Agency) obj;
		if (agencyId == null) {
			if (other.agencyId != null)
				return false;
		} else if (!agencyId.equals(other.agencyId))
			return false;
		return true;
	}
	
	
}
