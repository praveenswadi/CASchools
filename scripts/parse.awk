BEGIN {}
substr($0,15,1)=="S" {
	code     = substr($0,  1,14) # County/District/School code
	r_type   = substr($0, 15, 1) # D=District, S=School, X=State
	s_type   = substr($0, 16, 1) # 1=Unified, 2=Elementary District, 3=9-12 High District, 4=7-12 High District, E=Elementary School, M=Middle School, H=High School
	sped     = substr($0, 17, 1) # A= Alternative Schools Accountability Model (ASAM), E=Special Education, and C=Combination ASAM and Special Education
	size     = substr($0, 18, 1) # S=Small (11-99 Valid API Scores), T=Under 11 Valid API Scores
	charter  = substr($0, 19, 1) # Y=Charter, Not Direct Funded, D=Direct Funded Charter, Blank=Not a Charter School
	name     = substr($0, 20,40) # School Name
	gsub(/ +$/,"",name) # School Name
	district = substr($0, 60,30) # District Name
	gsub(/ +$/,"",district) # District Name
	county   = substr($0, 90,15) # County Name
	gsub(/ +$/,"",county) # County Name
	flag     = substr($0,105, 5) # Flag Values
	valid    = substr($0,110, 7) # Number of Scores included in the 2013 Academic Performance Index (API)
	api13    = substr($0,117, 5) # 2013 API (Growth)
	api12    = substr($0,122, 5) # 2012 API (Base)
	st_rank  = substr($0,1126, 5) # Statewide rank
	#printf("%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n",code,get_record_type(r_type),get_school_type(s_type),get_special_education_type(sped),size,get_charter_type(charter),name,district,county,flag,valid,api13,api12,st_rank)
	if (api13 > 0) {
		printf("%s\t%s\t%s\t%s\t%s\t%s\n",api13,get_school_type(s_type),name,district,county,valid)
	}
}

function get_record_type(rtype)
{
	if(rtype=="D") return "District"
	if(rtype=="S") return "School"
	if(rtype=="X") return "State"
	return ""
}

function get_school_type(stype)
{
	if(stype=="1") return "Unified"
	if(stype=="2") return "Elementry District"
	if(stype=="3") return "9-12 High District"
	if(stype=="4") return "7-12 High District"
	if(stype=="E") return "Elementary"
	if(stype=="M") return "Middle"
	if(stype=="H") return "High"
	return ""
}

function get_special_education_type(sped)
{
	if(sped=="A") return "ASAM"
	if(sped=="E") return "Special Education"
	if(sped=="C") return "Combination"
	return ""
}

function get_charter_type(charter)
{
	if(sped=="Y") return "Charter, Not Direct Funded"
	if(sped=="D") return "Direct Funded Charter"
	if(sped==" ") return "Not a Charter School"
	return ""
}
