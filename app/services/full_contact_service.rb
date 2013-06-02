class FullContactService
  def self.prep
    FullContact.configure {|config|config.api_key = "1a16de600ef423c2"}
  end

  def self.person(search)
    prep
    FullContact.person(search)
    #possibly will get a 202 error if email not found
  end

  def self.get_attributes_for_person(p)
    fcd = self.person(email: p.email)

    p.first_name   = self.first_name(fcd, "first name here")
    p.last_name    = self.last_name(fcd, "last name here")
    p.photo        = self.photo(fcd)
    p.corporation  = self.org(fcd, "Where are you working?")
    p.job_title    = self.title(fcd, "Job Title?")
    p.location     = self.location(fcd, "Please Enter Location")
  end

  def self.first_name(full_contact_details, default_value)
    begin
      full_contact_details.contact_info.given_name
    rescue
      default_value
    end 
  end

  def self.last_name(full_contact_details, default_value)
   begin
      full_contact_details.contact_info.family_name
    rescue
      default_value
    end 
  end


  def self.photo(full_contact_details)
   begin
      full_contact_details.photos.first.url
    rescue
      "http://www.gravatar.com/avatar/00000000000000000"
    end 
  end

  def self.org(full_contact_details, default_value)
    begin
      full_contact_details.organizations.first.name
    rescue
      default_value
    end
  end


  def self.title(full_contact_details, default_value)
    begin
      full_contact_details.social_profiles.first.bio
    rescue
      default_value
    end
  end


  def self.location(details, default_value)
    begin 
      details.demographics.location_general
    rescue
      default_value
    end
  end
end
